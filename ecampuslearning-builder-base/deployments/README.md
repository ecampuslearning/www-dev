# Deployments Directory

This directory contains Docker configurations, deployment resources, and container setup files for the DevContainer Base project.

## What's In Here

### Docker Configurations
- **`Dockerfile.base`**: Main multi-stage Docker setup with comprehensive build arguments and OCI metadata
- **`Dockerfile.template`**: Customizable Docker template for project-specific modifications
- **Build contexts**: Additional build resources and multi-architecture support files

### Deployment Features
- **Multi-stage builds**: Optimized caching and smaller final images
- **Build argument support**: Lots of customization via environment variables and build-time parameters
- **Metadata compliance**: Full OCI specification compliance with detailed image labeling
- **Registry integration**: Built-in support for container registries and automated tagging
- **Smart caching**: Comprehensive BuildKit cache mounts for faster builds

**Caching Details**: [Docker Build Caching Strategy](../docs/CACHING-STRATEGY.md)

## Build System Integration

### Main Build Interface
Use the Makefile in the project root for standard operations:
```bash
make base          # Stable build with Git version tagging
make base <tag>    # Build with tag (e.g., make base dev → base-dev, make base v1.0.0 → base-v1.0.0)
make clean         # Clean build cache and artifacts
```

### Advanced Build Operations
Use `docker-deploy.sh` directly for complex scenarios:
```bash
./scripts/docker-deploy.sh build --tag custom:latest -f deployments/Dockerfile.base .
./scripts/docker-deploy.sh build --build-arg CUSTOM_ARG=value -f deployments/Dockerfile.template .
```

### Environment Configuration
Customize build behavior via `.env` file in project root:
- **Image metadata**: Author, maintainer, and description info
- **Build arguments**: Feature flags and customization parameters
- **Registry settings**: Container registry endpoints and authentication

## CI/CD Integration

The deployment system works seamlessly with CI pipelines:
- **Git-based versioning**: Automatic version detection from Git tags and branches
- **Build cache optimization**: Smart layer caching for faster builds
- **Multi-architecture support**: Cross-platform container builds
- **Security scanning**: Integration points for vulnerability scanning tools

**CI/CD Documentation**: [GitHub Actions Workflows](../.github/workflows/README.md)

---

**Note on maintenance:** Always update docs to keep everything consistent.
