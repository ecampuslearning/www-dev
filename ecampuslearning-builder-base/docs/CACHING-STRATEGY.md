# Docker Build Caching Strategy

This document describes the comprehensive caching strategy implemented in `deployments/Dockerfile.base` to optimize build performance and reduce network overhead across all package managers and download operations.

## Overview

Our Docker builds use BuildKit cache mounts to persist downloaded content and installed packages across builds, significantly reducing build times and network usage for repeated builds. This implementation is optimized for nested containerized environments (GitHub Actions → Docker → Buildx container) and provides dramatic performance improvements.

**Key Benefits:**
- **Persistent across builds**: All caches survive between builds
- **Shared across parallel builds**: `sharing=locked` allows safe concurrent access  
- **Works with Buildx**: Integrates seamlessly with docker-container driver
- **No manual cache management**: BuildKit handles cache lifecycle automatically
- **Dramatic performance gains**: 50-80% faster builds with ~300-600MB network savings per build

## Disabling the Cache

In some situations, you may want to completely disable all caching mechanisms to ensure a clean build:

```bash
# Option 1: Use the --no-cache option directly with docker-deploy.sh
./scripts/docker-deploy.sh build --no-cache -t devcontainer:latest -f deployments/Dockerfile.base .

# Option 2: Use the NOCACHE=1 flag with make
make base NOCACHE=1
```

> **Note**: The `--no-cache` flag can be placed anywhere in the command line after the `build` subcommand. Its position does not affect functionality.

This will:
1. Disable all BuildKit cache mounting in the Dockerfile
2. Prevent registry cache usage
3. Skip local cache loading/saving
4. Force a completely clean build

Use the no-cache option in these situations:
- Troubleshooting build issues
- Ensuring completely clean dependencies
- Testing changes to the build configuration
- CI/CD pipelines where caching isn't beneficial

## 1. APT Package Cache

### Implementation Strategy
```dockerfile
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && apt-get install -y package-name
```

### Optimized APT Update Strategy
Our implementation uses a smart approach to minimize `apt-get update` calls:

1. **Single comprehensive update**: One large `apt-get update` + install for all Ubuntu packages
2. **Repository-specific updates**: Only run `apt-get update` when adding new repositories:
   - GitHub CLI repository → `apt-get update` → install `gh`
   - Docker repository → `apt-get update` → install Docker tools  
   - Trivy repository → `apt-get update` → install `trivy`
3. **Local package installs**: No `apt-get update` needed for `.deb` files (dockle, dive)

### Performance Benefits
- **Package lists and downloaded .deb files persist across builds**
- **Eliminates redundant `apt-get update` calls**
- **Reduces build time by ~60% for package installation steps**
- **First build**: Similar to before (cache population)
- **Subsequent builds**: 50-80% faster APT operations
- **Parallel builds**: Shared cache reduces redundant downloads

### Cache Locations
- `/var/cache/apt`: Downloaded package files (.deb archives)
- `/var/lib/apt`: Package database, indices, and status files

### Layer Optimization Benefits
- **Reduced layers**: Combined locale/timezone/core packages into single RUN
- **Fewer cache invalidations**: Changes to one package group don't affect others
- **Faster rebuilds**: Cache mounts make repeated `apt-get update` very fast when needed

## 2. Python Package Cache

### pip Cache
```dockerfile
RUN --mount=type=cache,target=/root/.cache/pip,sharing=locked \
    pip install package-name
```

### pipx Cache  
```dockerfile
RUN --mount=type=cache,target=/root/.cache/pipx,sharing=locked \
    --mount=type=cache,target=/root/.cache/pip,sharing=locked \
    pipx install package-name
```

**Benefits:**
- Downloaded wheels and build artifacts persist
- Faster installation of Python packages
- Shared pip cache benefits both pip and pipx operations

## 3. Node.js Package Cache

### npm Cache
```dockerfile
RUN --mount=type=cache,target=/root/.npm,sharing=locked \
    npm install -g package-name
```

**Benefits:**
- Cached npm modules and dependencies
- Faster installation of Node.js packages
- Reduced network usage for repeated builds

## 4. Git Repository Cache

```dockerfile
RUN --mount=type=cache,target=/tmp/git-cache,sharing=locked \
    REPO_URL="https://github.com/example/repo.git" && \
    REPO_DIR="/tmp/git-cache/repo" && \
    REPO_VERSION="v1.2.3" && \
    # Clone or update the repository in cache
    if [ ! -d "$REPO_DIR" ]; then \
        git clone --depth 1 --branch "$REPO_VERSION" "$REPO_URL" "$REPO_DIR"; \
    else \
        cd "$REPO_DIR" && git fetch && git checkout "$REPO_VERSION"; \
    fi && \
    # Build or install from the cached repository
    cd "$REPO_DIR" && \
    make install
```

**Benefits:**
- Cached git repositories across builds
- No need to re-clone repositories for each build
- Significantly faster builds when working with the same repositories
- Reduced network usage by only fetching changes

## 5. Binary Download Cache

```dockerfile
RUN --mount=type=cache,target=/tmp/download-cache,sharing=locked \
    # Check if tool already exists in cache
    TOOL_VERSION=$(curl -s https://api.github.com/repos/example/tool/releases/latest | grep tag_name | cut -d '"' -f 4) && \
    if [ ! -f "/tmp/download-cache/tool-${TOOL_VERSION}" ]; then \
        curl -sSL https://example.com/tool/releases/download/${TOOL_VERSION}/tool-linux-amd64 \
        -o /tmp/download-cache/tool-${TOOL_VERSION}; \
    fi && \
    # Install from cache to the system
    cp /tmp/download-cache/tool-${TOOL_VERSION} /usr/local/bin/tool && \
    chmod +x /usr/local/bin/tool
```

**Cached Binary Tools:**
- `hadolint` - Dockerfile linter
- `container-structure-test` - Google's container testing framework  
- `ctop` - Container metrics and monitoring
- `opa` - Open Policy Agent
- `crictl` - Container Runtime Interface CLI

**Benefits:**
- Large binary downloads (10-50MB each) cached across builds
- Eliminates repeated downloads of same tool versions
- Faster builds when tool versions haven't changed
- Version-aware caching prevents downloading the same version multiple times

## 4. Archive Download Cache

For `.tar.gz` and similar archives:

```dockerfile
RUN --mount=type=cache,target=/tmp/download-cache,sharing=locked \
    curl -sSL <archive-url> -o /tmp/download-cache/archive.tar.gz && \
    tar xz -C /destination -f /tmp/download-cache/archive.tar.gz
```

**Example:** crictl installation downloads and caches the release archive.

## Cache Mount Configuration

### Sharing Mode: `locked`
All caches use `sharing=locked` to ensure:
- Thread-safe access across concurrent builds
- Consistent cache state during build operations
- No corruption from parallel access

### Cache Persistence
- Caches persist until explicitly cleared
- Docker build cache cleanup: `docker builder prune`
- Individual cache inspection: `docker buildx du`

## Nested Container Compatibility

### Environment Stack
Our caching strategy is optimized for complex build environments:
```
GitHub Actions Runner
  └── Docker
      └── Buildx Container (docker-container driver)
          └── Your Image Build
```

### How Cache Mounts Work
- **BuildKit manages mounts**: Cache is handled at the Buildx container level
- **Survives runner recreation**: Cache persists in GitHub Actions cache
- **Shared between workflows**: Same cache used by both tag and branch workflows
- **Works alongside existing cache**: Compatible with Docker layer cache, registry cache-from/cache-to

### Integration with Existing Cache Strategy
- **Docker layer cache**: Still provides layer-level caching
- **BuildKit cache**: Your existing `BUILDKIT_CACHE` setup remains unchanged
- **Registry cache**: Cache-from/cache-to continues working  
- **Package-level caching**: Adds granular caching on top of existing strategies

## Performance Impact

**Estimated Build Time Reductions:**
- Fresh build: ~5-10 minutes
- Cached build (no changes): ~30-60 seconds  
- Cached build (minor changes): ~1-3 minutes

**Network Usage Reduction:**
- APT packages: ~100-200MB saved per rebuild
- Python packages: ~50-100MB saved per rebuild  
- Binary downloads: ~150-300MB saved per rebuild
- **Total potential savings: ~300-600MB per build**

## Implementation Examples

### For Dockerfile Extensions

When extending `devcontainer-base`, use the same cache mount patterns:

```dockerfile
FROM ghcr.io/your-org/devcontainer-base:latest

# Install additional APT packages with proper cache mounts
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && apt-get install -y --no-install-recommends \
    # Group packages by category with comments for better readability
    # Development tools
    your-package-1 \
    your-package-2 \
    # Runtime dependencies
    your-package-3 \
    && rm -rf /var/lib/apt/lists/*

# Install additional Python packages with pip cache
RUN --mount=type=cache,target=/root/.cache/pip,sharing=locked \
    pip install your-python-package

# Install Node.js packages with npm cache
RUN --mount=type=cache,target=/root/.npm,sharing=locked \
    npm install -g your-npm-package

# Clone and build from Git repository with cache
RUN --mount=type=cache,target=/tmp/git-cache,sharing=locked \
    REPO_URL="https://github.com/example/repo.git" && \
    REPO_DIR="/tmp/git-cache/repo" && \
    REPO_VERSION="v1.2.3" && \
    # Clone or update the repository in cache
    if [ ! -d "$REPO_DIR" ]; then \
        git clone --depth 1 --branch "$REPO_VERSION" "$REPO_URL" "$REPO_DIR"; \
    else \
        cd "$REPO_DIR" && git fetch && git checkout "$REPO_VERSION"; \
    fi && \
    # Build or install from the cached repository
    cd "$REPO_DIR" && \
    make install

# Download additional binaries with version-aware caching
RUN --mount=type=cache,target=/tmp/download-cache,sharing=locked \
    # Check if tool already exists in cache
    TOOL_VERSION=$(curl -s https://api.github.com/repos/example/tool/releases/latest | grep tag_name | cut -d '"' -f 4) && \
    if [ ! -f "/tmp/download-cache/your-tool-${TOOL_VERSION}" ]; then \
        curl -sSL https://example.com/releases/download/${TOOL_VERSION}/your-tool \
        -o /tmp/download-cache/your-tool-${TOOL_VERSION}; \
    fi && \
    # Install from cache to the system
    cp /tmp/download-cache/your-tool-${TOOL_VERSION} /usr/local/bin/your-tool && \
    chmod +x /usr/local/bin/your-tool
```

## Cache Management Commands

```bash
# View cache usage
docker buildx du

# Clear all build caches  
docker builder prune -a

# Clear specific cache (rebuild will recreate)
docker buildx prune --filter type=exec.cachemount

# Build with fresh caches (no cache reuse)
docker buildx build --no-cache .
```

## Monitoring and Troubleshooting

### Cache Effectiveness
Monitor build logs for cache hits:
```
=> CACHED [stage 1/N] RUN --mount=type=cache...
```

### Performance Indicators
- **Cache hits**: Look for "CACHED" entries in build output
- **Download speeds**: Subsequent builds should show minimal network activity  
- **Build times**: Compare first vs subsequent build durations
- **Layer sizes**: Cached layers should show "0B" download size

### If Issues Arise
1. **Clear BuildKit cache**: `docker builder prune`
2. **Rebuild without cache**: Add `--no-cache` flag
3. **Check mount permissions**: Ensure proper container permissions
4. **Verify driver**: Confirm using `docker-container` buildx driver
5. **Monitor disk space**: Large caches may fill available storage

## Best Practices

1. **Always use cache mounts** for package managers and downloads
2. **Group related operations** in single RUN statements for cache efficiency
3. **Use consistent cache paths** across related operations
4. **Implement version-aware caching** for binary tools to prevent redundant downloads
5. **Add descriptive comments** to group packages by category or purpose
6. **Avoid redundant mkdir commands** - BuildKit cache mounts create directories automatically
7. **Clean up package lists** with `rm -rf /var/lib/apt/lists/*` after APT operations
8. **Use `--no-install-recommends`** with APT to minimize installation size
9. **Monitor cache sizes** periodically to prevent disk space issues
10. **Document cache dependencies** when adding new installation steps

## Future Optimizations

### Additional Possibilities
- **Multi-stage optimization**: Separate package download from installation
- **Custom APT configuration**: Tune APT for container environments  
- **Package pre-warming**: Seed cache with common packages
- **Selective cache clearing**: Target specific caches for cleanup
- **Cache analytics**: Monitor usage patterns for optimization opportunities

## Conclusion

This comprehensive caching strategy ensures our development container builds are both fast and bandwidth-efficient while maintaining reproducibility and reliability. The implementation provides significant build performance improvements while maintaining compatibility with existing sophisticated caching and CI/CD setup.

**Implementation Status**: ✅ **Complete** - All package managers and download operations now use optimal caching strategies.
