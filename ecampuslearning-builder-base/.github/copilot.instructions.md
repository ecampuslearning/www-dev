# GitHub Copilot Instructions for DevContainer Base Project

## Project Overview
This is a comprehensive Docker-based development environment (devcontainer) foundation built on Ubuntu 24.04 that provides a flexible, hierarchical script execution system for consistent development environments. The project emphasizes reliability, modularity, and ease of customization with fail-safe mechanisms and resume capabilities.

---

**Documentation maintenance:** This project serves as a base template for other devcontainer projects. Always update documentation and instructions to maintain consistency across implementations. Note: If there is a `.devcontainer` directory present, do not update files within it as they are copies - always update the main project files instead.

---

## Key Architecture Components

### Core Build System
- **Makefile**: Primary interface for Docker operations with targets like `make base`, `make base <tag>`, and `make clean`
- **docker-deploy.sh**: Intelligent Docker wrapper with BuildKit support, signal handling, and registry integration
- **Dockerfile.base**: Multi-stage Docker configuration in `deployments/` with Ubuntu 24.04 base, comprehensive metadata, and build args
- **CI/CD Workflows**: Three GitHub Actions workflows for branch testing, release deployment, and dependency updates

### Script Execution System
- **entrypoint.sh**: Sophisticated setup orchestrator with state tracking, validation, and resume capabilities
- **Setup Scripts**: Hierarchical organization in `scripts/setup.d/` with numerical prefixes for execution order
- **Execution Modes**: Normal startup (essential scripts only) vs. full setup (complete initialization)

## Development Patterns & Best Practices

### Naming Conventions
- **Docker Images**: Follow pattern `<project-name>:<git-branch>` or `<project-name>:base-dev`
- **Script Files**: Use kebab-case with clear descriptive names (e.g., `docker-deploy.sh`, `apt-update.sh`)
- **Setup Scripts**: Numerical prefixes control execution order (`00-bootstrap`, `10-packages`, `99-completion`)
- **Parallel Folders**: Any subfolder without `.sh` extension enables parallel execution of contained scripts

### Code Quality Standards
- **Shell Scripts**: Use `#!/bin/bash` with `set -euo pipefail` for robust error handling
- **Docker Operations**: Always use `scripts/docker-deploy.sh` wrapper or Makefile instead of direct Docker CLI
- **Environment Variables**: Override via `.env` file (gitignored) following the `.env.example` template
- **Error Handling**: Implement comprehensive error checking with descriptive messages

### Script System Architecture
- **Sequential Execution**: Between numbered folders (00 → 10 → 20 → ...)
- **Mixed Execution**: Within folders - individual scripts run sequentially, subfolders run in parallel
- **Resource Coordination**: Use `.resources` files to prevent conflicts between parallel scripts
- **State Management**: Automatic tracking enables resume capability after script failures

## Essential Commands & Workflows

### Primary Operations
- **Build Base Image**: `make base` - Stable build with version tagging
- **Build Custom Tagged Image**: `make base <tag>` - Build with tag (e.g., make base dev → base-dev, make base v1.0.0 → base-v1.0.0)
- **Clean Build Cache**: `make clean` - Removes Docker build artifacts
- **Script Validation**: `./scripts/entrypoint.sh --validate-only` - Pre-flight script checks

### Advanced Script Operations
- **Full Setup**: `./scripts/entrypoint.sh --setup` - Complete initialization sequence
- **Resume After Failure**: `./scripts/entrypoint.sh --setup --resume` - Skip completed scripts
- **Continue on Error**: `./scripts/entrypoint.sh --setup --continue-on-error` - Non-blocking execution
- **Force Execution**: `./scripts/entrypoint.sh --setup --force` - Override lock files

### Development Workflow
1. **Add Setup Scripts**: Place in appropriate `scripts/setup.d/XX-category/` folder
2. **Test Validation**: Run `--validate-only` before executing scripts
3. **Iterative Development**: Use `--resume` flag when debugging script failures
4. **Build Integration**: Use Makefile targets for consistent Docker operations

## System Dependencies & Requirements

### Required Tools
- **Docker**: Latest version with BuildKit support enabled
- **Git**: For versioning information in Docker image labels and branch detection
- **Make**: For executing Makefile targets and build automation
- **Bash**: Version 4.0+ for advanced script features and robust error handling

### Pre-installed Security & Analysis Tools
The container includes comprehensive tooling:
- **Container Security**: Trivy, Hadolint, Dockle, Dive
- **Vulnerability Scanning**: Grype, Checkov
- **SBOM Generation**: Syft
- **Container Testing**: Goss, Container-structure-test
- **Monitoring**: ctop
- **Policy**: Open Policy Agent (OPA)
- **Container Runtime**: crictl

### Optional Enhancements
- **Docker Compose**: For multi-container development scenarios
- **VS Code Dev Containers**: For integrated development environment
- **Container Registry**: For image distribution and CI/CD integration (GHCR configured)

## Architecture Insights & Extensibility

### Reliability Features
- **Fail-Fast Protection**: Scripts exit immediately on error with descriptive messages
- **State Persistence**: JSON-based tracking enables resumption after fixing issues
- **Resource Coordination**: Prevents conflicts between parallel script execution
- **Validation System**: Pre-execution checks ensure script integrity and dependencies

### Customization Points
- **Environment Variables**: Comprehensive `.env` support for build-time and runtime configuration
- **Build Arguments**: Extensive Docker build args for image metadata and feature flags
- **Script Hooks**: Well-defined execution phases for custom initialization logic
- **Template System**: `Dockerfile.template` for project-specific Docker customizations
- **GitHub Actions**: Automated workflows for branch testing, release deployment, and dependency management

## CI/CD Integration

### GitHub Actions Workflows
- **build-base-branches.yml**: Tests builds on pull requests and branch pushes to `base` and `base-dev`
- **build-base-tags.yml**: Automated image publishing to GHCR when tags are created
- **update-dockerfile-args.yml**: Dependabot integration for automatic Dockerfile ARG updates

### Registry Integration
Images are automatically published to GitHub Container Registry:
- **Release Images**: `ghcr.io/izykitten/devcontainer:base`, `ghcr.io/izykitten/devcontainer:base-v1.0.0`
- **Development Images**: `ghcr.io/izykitten/devcontainer:base-dev`, `ghcr.io/izykitten/devcontainer:base-dev-v1.0.0-beta.1`

### Dependency Management
- **Dependabot**: Weekly checks for Docker and GitHub Actions dependencies
- **Automatic Updates**: PRs target `base-dev` branch for testing
- **Security Scanning**: Integrated vulnerability detection and compliance checking

## Documentation Standards & Maintenance

### Documentation Philosophy
- **Markdown Format**: All documentation uses Markdown with consistent formatting
- **Context-Rich Comments**: Code comments explain "why" and business logic, not obvious "what"
- **Living Documentation**: Keep README.md and docs/ folder synchronized with actual functionality
- **Reference Integration**: Always reference Makefile targets and script system in setup instructions

### Maintenance Guidelines
- **Single Source of Truth**: Update documentation in main project root only
- **Template Considerations**: When used as template, maintain documentation consistency
- **Version Alignment**: Keep documentation version-aligned with actual script capabilities
- **User-Centric**: Focus on practical usage patterns and troubleshooting workflows

### Content Organization
- **Main README**: Project overview, quick start, and primary workflows
- **Setup Scripts Guide**: Detailed script system documentation with examples
- **Cheat Sheet**: Quick command reference for daily operations
- **Quick Reference**: Comprehensive command and pattern reference
- **Caching Strategy**: Docker build optimization and caching implementation guide

### Current Project State (August 2025)
- **Base Image**: Ubuntu 24.04 with digest pinning for reproducibility
- **Container Registry**: GitHub Container Registry (GHCR) with automated publishing
- **Security Tooling**: Comprehensive suite of container security and analysis tools
- **CI/CD**: Three-workflow system for comprehensive automation
- **Documentation**: Casual, approachable tone while maintaining technical accuracy

---

**Development Methodology**: This project emphasizes reliability, maintainability, and developer experience through comprehensive automation, clear documentation, and robust error handling patterns.

**If you are updating documentation or instructions, maintain consistency across all documentation files. Important: Do not update any files within a `.devcontainer` directory if present - always update the main project files instead as they are the authoritative source.**
