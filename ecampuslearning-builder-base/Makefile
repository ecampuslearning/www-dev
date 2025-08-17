# DevContainer Base - Build Automation Makefile
#
# This Makefile provides a standardized interface for Docker build operations,
# image tagging, and cache management. It integrates with the project's
# docker-deploy.sh wrapper script and supports extensive build customization
# through environment variables.
#
# Primary Targets:
#   make base      - Build stable image with Git version tagging
#   make base <tag> - Build image with tag (e.g., make base dev → base-dev, make base v1.0.0 → base-v1.0.0)
#   make clean     - Clean Docker build cache and artifacts
#   make help      - Display usage information
#
# Environment Configuration:
#   Variables can be overridden via .env file or environment exports
#   See .env.example for complete variable documentation

# Load environment configuration if present
# This enables project-specific customization without modifying the Makefile
-include .env
export

# Build Configuration Variables
# These variables control Docker build behavior and image metadata
# Image metadata and build arguments
# Override these via .env file for project-specific customization
IMAGE_AUTHORS ?=
IMAGE_MAINTAINERS_JSON ?=
IMAGE_VENDOR ?=
IMAGE_VENDOR_URL ?=

# Docker image naming and tagging configuration  
DOCKER_IMAGE := $(notdir $(CURDIR))
PROJECT ?= $(notdir $(CURDIR))
GIT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
DOCKER_TAG ?= $(subst /,-,$(GIT_BRANCH))
DOCKERFILE_PATH = deployments/Dockerfile.base

# Version and source control integration
IMAGE_SOURCE ?=
BASE_IMAGE_VERSION ?= $(shell git describe --tags --always 2>/dev/null || echo unknown)
GIT_TAG := $(shell git describe --tags --exact-match 2>/dev/null || echo dev)
IS_PRERELEASE := $(shell echo "$(GIT_TAG)" | grep -E 'alpha|beta|rc' >/dev/null && echo 1 || echo 0)

# Image feature and classification metadata
IMAGE_DEPRECATED ?=false
IMAGE_GITHUB_COLOR ?=purple
IMAGE_FEATURES ?=git,python,trivy,hadolint,dockle,dive,checkov,syft,grype,goss,ctop,opa,crictl
IMAGE_KEYWORDS ?=devcontainer,ubuntu,development,cli,tools,git,python,trivy,hadolint,dockle,dive,checkov,syft,grype,goss,ctop,opa,crictl
IMAGE_TITLE ?=Devcontainer Base Image
IMAGE_DESCRIPTION ?=Base image for devcontainers with common CLI tools and developer utilities

# Default container user configuration
DEVCONTAINER_USER ?=vscode

# Makefile target declarations
.PHONY: all clean help base

# Default target - displays help information
all: help

# Build cache management
# Removes Docker builder cache to reclaim disk space and ensure clean builds
clean:
	@echo "Cleaning Docker build cache..."
	docker builder prune -f
	@echo "✓ Build cache cleaned successfully"

# Production image build target
# Creates a stable image with Git version tagging and comprehensive metadata
# Usage: make base [TAG] [NOCACHE=1]
# Examples:
#   make base           -> builds devcontainer:base
#   make base dev       -> builds devcontainer:base-dev
#   make base v1.0.0    -> builds devcontainer:base-v1.0.0
#   make base NOCACHE=1 -> builds with cache disabled
base:
	$(eval RAW_TAG := $(if $(word 2,$(MAKECMDGOALS)),$(word 2,$(MAKECMDGOALS)),base))
	$(eval BUILD_TAG := $(if $(filter base,$(RAW_TAG)),base,base-$(RAW_TAG)))
	@echo "Building image: $(DOCKER_IMAGE):$(BUILD_TAG)"
	@if [ "$(NOCACHE)" = "1" ]; then \
	  echo "Building with cache disabled (--no-cache)"; \
	  bash scripts/docker-deploy.sh build \
	    --no-cache \
	    --pull \
	    --build-arg IMAGE_AUTHORS="$(IMAGE_AUTHORS)" \
	    --build-arg IMAGE_MAINTAINERS_JSON="$(IMAGE_MAINTAINERS_JSON)" \
	    --build-arg IMAGE_VENDOR="$(IMAGE_VENDOR)" \
	    --build-arg IMAGE_VENDOR_URL="$(IMAGE_VENDOR_URL)" \
	    --build-arg IMAGE_VERSION="$(if $(filter dev,$(BUILD_TAG)),dev,$(BASE_IMAGE_VERSION))" \
	    --build-arg IMAGE_CREATED="$(shell date -u +'%Y-%m-%dT%H:%M:%SZ')" \
	    --build-arg IMAGE_REVISION="$(shell git rev-parse --short HEAD 2>/dev/null || echo unknown)" \
	    --build-arg IMAGE_SOURCE="$(IMAGE_SOURCE)" \
	    --build-arg PROJECT="$(PROJECT)" \
	    --build-arg IMAGE_DEPRECATED="$(IMAGE_DEPRECATED)" \
	    --build-arg IMAGE_GITHUB_COLOR="$(IMAGE_GITHUB_COLOR)" \
	    --build-arg IMAGE_FEATURES="$(IMAGE_FEATURES)" \
	    --build-arg IMAGE_KEYWORDS="$(IMAGE_KEYWORDS)" \
	    --build-arg IMAGE_TITLE="$(IMAGE_TITLE)" \
	    --build-arg IMAGE_DESCRIPTION="$(IMAGE_DESCRIPTION)" \
	    --build-arg USER="$(DEVCONTAINER_USER)" \
	    -t $(DOCKER_IMAGE):$(BUILD_TAG) \
	    -f $(DOCKERFILE_PATH) .; \
	else \
	  bash scripts/docker-deploy.sh build \
	    --build-arg IMAGE_AUTHORS="$(IMAGE_AUTHORS)" \
	    --build-arg IMAGE_MAINTAINERS_JSON="$(IMAGE_MAINTAINERS_JSON)" \
	    --build-arg IMAGE_VENDOR="$(IMAGE_VENDOR)" \
	    --build-arg IMAGE_VENDOR_URL="$(IMAGE_VENDOR_URL)" \
	    --build-arg IMAGE_VERSION="$(if $(filter dev,$(BUILD_TAG)),dev,$(BASE_IMAGE_VERSION))" \
	    --build-arg IMAGE_CREATED="$(shell date -u +'%Y-%m-%dT%H:%M:%SZ')" \
	    --build-arg IMAGE_REVISION="$(shell git rev-parse --short HEAD 2>/dev/null || echo unknown)" \
	    --build-arg IMAGE_SOURCE="$(IMAGE_SOURCE)" \
	    --build-arg PROJECT="$(PROJECT)" \
	    --build-arg IMAGE_DEPRECATED="$(IMAGE_DEPRECATED)" \
	    --build-arg IMAGE_GITHUB_COLOR="$(IMAGE_GITHUB_COLOR)" \
	    --build-arg IMAGE_FEATURES="$(IMAGE_FEATURES)" \
	    --build-arg IMAGE_KEYWORDS="$(IMAGE_KEYWORDS)" \
	    --build-arg IMAGE_TITLE="$(IMAGE_TITLE)" \
	    --build-arg IMAGE_DESCRIPTION="$(IMAGE_DESCRIPTION)" \
	    --build-arg USER="$(DEVCONTAINER_USER)" \
	    -t $(DOCKER_IMAGE):$(BUILD_TAG) \
	    -f $(DOCKERFILE_PATH) .; \
	fi
	@echo "✓ Image built and tagged as $(DOCKER_IMAGE):$(BUILD_TAG)"

# Prevent make from treating the tag argument as a target
%:
	@:

# Help target - displays usage information and available commands
help:
	@echo "DevContainer Base - Build Automation"
	@echo "===================================="
	@echo ""
	@echo "Available targets:"
	@echo "  make base [TAG]    - Build image with optional tag (default: base)"
	@echo "                       Examples:"
	@echo "                         make base           -> devcontainer:base"
	@echo "                         make base dev       -> devcontainer:base-dev"
	@echo "                         make base v1.0.0    -> devcontainer:base-v1.0.0"
	@echo "                       Options:"
	@echo "                         make base NOCACHE=1 -> Disable all caching for a clean build"
	@echo "                                               (uses --no-cache parameter in docker-deploy.sh)"
	@echo "  make clean         - Clean Docker build cache and temporary artifacts"
	@echo "  make help          - Display this help information"
	@echo ""
	@echo "Environment Configuration:"
	@echo "  Copy .env.example to .env and customize variables as needed"
	@echo "  All build operations use the docker-deploy.sh wrapper for enhanced functionality"
	@echo ""
	@echo "Current Configuration:"
	@echo "  Project: $(PROJECT)"
	@echo "  Git Branch: $(GIT_BRANCH)"
	@echo "  Docker Tag: $(DOCKER_TAG)"
	@echo "  Image: $(DOCKER_IMAGE):$(GIT_TAG)"
	@echo ""
	@echo "For detailed documentation, see docs/ directory and README.md"
