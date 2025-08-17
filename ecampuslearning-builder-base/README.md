# DevContainer Base

A comprehensive development container foundation built on Ubuntu 24.04 with advanced script orchestration, reliability features, and flexible deployment options.

---

## Overview

This project gives you a solid foundation for creating consistent, reliable development environments using containers. Here's what you get:

### Core Capabilities
- **Smart Script System**: Scripts that remember where they failed and let you resume from there
- **Modern Build System**: Docker BuildKit with multi-stage builds, optimized caching, and all the metadata you need
- **Rock-Solid Reliability**: Fail-fast protection with easy recovery and resource coordination
- **VS Code Ready**: Seamless DevContainer integration that just works out of the box
- **Stable Build System**: Proper Docker image labeling, multi-architecture support, and CI/CD friendly
- **Optimized Caching**: Comprehensive caching strategy for all package managers and downloads

## Quick Start

### Initial Setup
1. **Clone or copy** this template to your project
2. **Customize Docker setup** in `deployments/Dockerfile.base` (or use the templates)
3. **Set up your environment** by copying `.env.example` to `.env` and tweaking the values
4. **Add your own setup scripts** to `scripts/setup.d/00-bootstrap/`
5. **Build and go** using the integrated build system

### Essential Commands
```bash
# Build stable image with version tagging
make base

# Build development image with dev tag
make base dev

# Clean Docker build cache
make clean

# Validate all setup scripts before execution
./scripts/entrypoint.sh --validate-only
```

### VS Code DevContainer Integration
Just open the project in VS Code with the Dev Containers extension installed. The container will build automatically and run the setup system on first start - no extra work needed!

## Advanced Features

### Dependency Management
- **Auto Updates**: Dependabot checks for Docker and GitHub Actions updates weekly
- **Security Monitoring**: Catches security vulnerabilities automatically
- **More Details**: Check out [GitHub Integration](.github/README.md) for setup and customization

### Execution Modes & Script Management
- **Quick Startup**: Fast execution of essential scripts (just the 00-* folders) for quick container starts
- **Full Setup Mode**: Complete initialization running all script folders in the right order
- **Resume Feature**: Smart state tracking lets you resume after fixing script failures
- **Validation**: Check all your scripts before running them to catch issues early

### What Makes This Special
- **Clean Organization**: Scripts organized by purpose with clear naming that makes sense
- **Smart Execution**: Runs folders in order, but can run scripts in parallel within folders when it's safe
- **Resource Protection**: Prevents conflicts between parallel operations using smart locking
- **Great Error Handling**: Fails fast with clear messages and shows you exactly how to fix things

### Build System Integration
- **Multi-Target Makefile**: Standardized build targets with environment variable support
- **Docker BuildKit**: Advanced build features with multi-stage optimization and caching
- **Registry Integration**: Built-in support for container registry operations and CI/CD workflows
- **Metadata Management**: Comprehensive image labeling following OCI specifications
- **Optimized Caching**: BuildKit cache mounts for faster builds and reduced network usage

### Caching Strategy
- **APT Package Cache**: Optimized package installation with minimal network usage
- **Tool Download Cache**: Version-aware caching for GitHub releases and other binaries
- **Language-Specific Caches**: Optimized pip, npm, and other package manager caches
- **Git Repository Cache**: Efficient cloning and updating of external repositories
- **Consistent Patterns**: Standardized caching approach across all operations

## Project Architecture

```
.github/
├── workflows/                       # CI/CD automation workflows
│   ├── build-base-tags.yml          # Release deployment workflow
│   └── README.md                    # Workflow documentation and troubleshooting
└── copilot.instructions.md          # AI assistant project context
scripts/
├── entrypoint.sh                    # Primary script orchestrator with state management
├── docker-deploy.sh                 # Intelligent Docker/Compose wrapper
├── update.sh                        # System update automation
├── setup.d/                         # Hierarchical setup script organization
│   ├── 00-bootstrap/                # Essential startup scripts (always executed)
│   │   └── 00-apt-update.sh         # System package updates
│   ├── 99-completion/               # Finalization scripts (always executed)
│   │   └── 01-welcome-summary.sh    # Environment summary and status
└── update.d/                        # System update scripts
deployments/
├── Dockerfile.base                  # Primary multi-stage Docker configuration
├── Dockerfile.template              # Customizable Docker template
└── README.md                        # Deployment documentation
config/                              # Configuration file storage
docs/                                # Comprehensive project documentation
├── SETUP-SCRIPTS.md                 # Script system detailed guide
├── CHEAT-SHEET.md                   # Quick command reference
└── QUICK-REFERENCE.md               # Comprehensive command guide
Makefile                             # Primary build automation interface
.env.example                         # Environment configuration template
devcontainer.json                    # DevContainer specification
```

## Build System Reference

### Primary Makefile Targets
- `make base`           - Build stable image with Git version tagging
- `make base <tag>`     - Build image with tag (e.g., make base dev → base-dev, make base v1.0.0 → base-v1.0.0)
- `make clean`          - Clean Docker build cache and temporary artifacts
- `make help`           - Display available targets and usage information

### Advanced Docker Operations
The `scripts/docker-deploy.sh` wrapper provides enhanced Docker functionality:
- **BuildKit Integration**: Automatic multi-platform build support
- **Signal Handling**: Graceful interrupt handling for long-running operations
- **Registry Support**: Built-in container registry push/pull capabilities
- **Build Cache Management**: Intelligent caching for faster subsequent builds

### Environment Configuration
Environment variables can be configured via `.env` file:
```bash
# Copy template and customize
cp .env.example .env
# Edit .env with your specific configuration
```

## Script System Overview

The script system makes container setup reliable and easy to manage:

### How It Works
- **Folders Run in Order**: Ensures proper dependencies (00 → 10 → 20 → ... you get the idea)
- **Flexible Within Folders**: Scripts run one by one, but subfolders can run in parallel when safe
- **Smart Resource Management**: `.resources` files prevent conflicts between parallel operations
- **Remembers Progress**: JSON tracking lets you resume right where you left off after fixing issues

### Common Commands
```bash
# Full setup - runs everything
./scripts/entrypoint.sh --setup

# Resume after fixing a failed script
./scripts/entrypoint.sh --setup --resume

# Check all scripts without running them
./scripts/entrypoint.sh --validate-only

# Keep going even if some scripts fail
./scripts/entrypoint.sh --setup --continue-on-error
```

Want more details? Check out the [complete script documentation](docs/SETUP-SCRIPTS.md)

## Deployment & Integration

### Container Deployment
Use the provided automation tools for all Docker operations:
- **Makefile Targets**: Your main interface for building and deploying
- **docker-deploy.sh**: Advanced wrapper for complex Docker/Compose scenarios
- **BuildKit Integration**: Multi-architecture builds with smart caching

### CI/CD Integration
We've got comprehensive GitHub Actions workflows that handle building, testing, and deployment automatically:

#### What Runs Automatically
- **Branch Testing** (`build-base-branches.yml`): Tests builds on PRs and branch pushes
  - Tests both base and base-dev images
  - Runs automatically on base and base-dev branches
  - Validates pull requests before merging
  - Includes container security verification

- **Release Deployment** (`build-base-tags.yml`): Publishes images when you create tags
  - Figures out versions from Git tags automatically
  - Pushes to GitHub Container Registry (GHCR)
  - Handles both prerelease and stable releases
  - Gives you detailed build logs

- **Dependency Updates** (`update-dockerfile-args.yml`): Keeps your Dockerfile up to date
  - Works with Dependabot for base image updates
  - Updates ARG variables automatically
  - Pins digests for reproducible builds

#### Where Images Get Published
Images automatically go to GitHub Container Registry:
```bash
# Release images (when you tag a version)
ghcr.io/izykitten/devcontainer:base
ghcr.io/izykitten/devcontainer:v1.0.0

# Development images (for prerelease tags)
ghcr.io/izykitten/devcontainer:base-dev
ghcr.io/izykitten/devcontainer:v1.0.0-beta.1
```

#### Environment Setup
CI/CD builds use comprehensive environment configuration:
- **Image Metadata**: Author, maintainer, and description info
- **Build Arguments**: Feature flags and customization options
- **Registry Settings**: Container registry endpoints and authentication
- **Security Integration**: Vulnerability scanning and compliance checking

**More Info**: [GitHub Actions Workflows](.github/workflows/README.md) | [Deployment Details](deployments/README.md)

## Documentation Resources

### Quick Access Guides
- **[Setup Scripts Guide](docs/SETUP-SCRIPTS.md)**: Complete script system docs with examples and troubleshooting
- **[Command Cheat Sheet](docs/CHEAT-SHEET.md)**: Essential commands for everyday development
- **[Quick Reference](docs/QUICK-REFERENCE.md)**: Complete command and pattern reference
- **[Caching Strategy](docs/CACHING-STRATEGY.md)**: Docker build optimization and caching tips
- **[GitHub Actions Workflows](.github/workflows/README.md)**: CI/CD automation docs and troubleshooting

### Development Support
All documentation stays consistent no matter how you deploy, and provides practical, actionable guidance whether you're new to this or a seasoned pro.

---

**Note on maintenance:** This project can be used as a template for other devcontainer projects. Always maintain consistency across documentation.
