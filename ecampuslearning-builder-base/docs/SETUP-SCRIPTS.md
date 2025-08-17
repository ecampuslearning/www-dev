# DevContainer Script System - Complete Guide

The DevContainer Base project features a sophisticated script orchestration system designed for reliability, flexibility, and developer productivity. This guide covers all aspects of the script system architecture and usage patterns.

---

## Quick Start Commands

### Primary Build Operations
Use the Makefile for standard operations:

```bash
make base          # Build stable image with Git version tagging
make base <tag>    # Build with tag (e.g., make base dev → base-dev, make base v1.0.0 → base-v1.0.0)
make clean         # Clean Docker build cache and artifacts
```

### Script System Operations
Direct script system usage for development and troubleshooting:

```bash
./scripts/entrypoint.sh                    # Normal startup (essential scripts only)
./scripts/entrypoint.sh --setup            # Full setup (complete initialization)
./scripts/entrypoint.sh --validate-only    # Pre-execution script validation
./scripts/entrypoint.sh --setup --resume   # Resume after fixing failed scripts
```

## Advanced Reliability Features

The script system implements comprehensive reliability engineering patterns:

### Error Handling & Recovery
| Feature | Implementation | Benefit |
|---------|----------------|---------|
| **Fail-Fast Protection** | Immediate exit on script failure with detailed error context | Prevents cascading failures and unclear error states |
| **State Persistence** | JSON-based execution tracking with script-level granularity | Enables precise resumption after fixing issues |
| **Resource Coordination** | File-based locking system with dependency awareness | Prevents conflicts between parallel script operations |
| **Pre-Execution Validation** | Comprehensive script and dependency checking | Catches issues before execution begins |

### Execution Control Options
```bash
# Reliability and Safety Controls
./scripts/entrypoint.sh --validate-only           # Comprehensive pre-flight checks
./scripts/entrypoint.sh --setup --fail-fast       # Default: stop on first error
./scripts/entrypoint.sh --setup --continue-on-error  # Continue despite script failures
./scripts/entrypoint.sh --setup --force           # Override lock files and state

# Recovery and Resume Operations  
./scripts/entrypoint.sh --setup --resume          # Skip successfully completed scripts
./scripts/entrypoint.sh --setup --enable-rollback # Track rollback commands for cleanup

# Output Control and Debugging
./scripts/entrypoint.sh --setup --quiet           # Suppress non-essential output
./scripts/entrypoint.sh --setup --silent          # Maximum output suppression
```

## Script System Architecture

### Execution Model Overview
The system implements a sophisticated two-tier execution model:

#### Tier 1: Sequential Folder Processing
Folders are processed in numerical order ensuring proper dependency management:
```
00-bootstrap/ → 10-packages/ → 20-configuration/ → ... → 99-completion/
```

#### Tier 2: Mixed Execution Within Folders
Within each folder, execution follows these rules:
- **Individual Scripts** (`.sh` files): Execute sequentially in alphanumeric order
- **Subfolders**: Execute in parallel with resource coordination
- **Resource Files** (`.resources`): Define coordination requirements between parallel operations

### Operational Workflow Example
```bash
# Comprehensive setup with state tracking and recovery capability
./scripts/entrypoint.sh --setup

# Example execution flow:
# 1. Pre-execution validation of all scripts and dependencies
# 2. Sequential processing: 00-bootstrap/ → 99-completion/
# 3. Within folders: scripts run sequentially, subfolders run in parallel
# 4. State tracking enables resumption if any script fails
# 5. Resource coordination prevents conflicts between parallel operations

# Resume workflow after fixing issues
./scripts/entrypoint.sh --setup --resume
# Only re-executes failed scripts, skips successful ones
# Maintains resource coordination and dependency order
```

## Advanced Configuration Options

### Parallel Execution Configuration
Subfolders can be configured for optimized parallel execution:

#### Basic Parallel Folder
```bash
scripts/setup.d/10-packages/
├── 01-sequential-prep.sh        # Runs first (sequential)
├── parallel-installs/           # Parallel subfolder
│   ├── .parallel                # Config: description=Package Installation
│   ├── install-python.sh        # } Coordinated
│   ├── install-node.sh          # } parallel
│   └── install-golang.sh        # } execution
└── 99-sequential-cleanup.sh     # Runs last (sequential)
```

#### Parallel Configuration File (`.parallel`)
```bash
# Content of .parallel file
description=System Package Installation
# Optional: max_concurrent=3
# Optional: timeout=300
```

## Recovery & Troubleshooting Workflow

### Standard Recovery Process
When script execution fails, follow this systematic recovery approach:

#### 1. Initial Failure Analysis
```bash
# The system stops with detailed error information
# Error message includes:
# - Failed script path and line number
# - Exit code and error context
# - State file location for resume capability
```

#### 2. Issue Investigation & Resolution
```bash
# Examine the failed script
cat scripts/setup.d/XX-category/failed-script.sh

# Check system state and logs
# Fix the underlying issue (permissions, dependencies, etc.)
```

#### 3. Validation & Resume
```bash
# Validate fix before resuming (recommended)
./scripts/entrypoint.sh --validate-only

# Resume execution from the point of failure
./scripts/entrypoint.sh --setup --resume
# Only re-runs the failed script and subsequent unexecuted scripts
# Skips all previously successful scripts
```

### Advanced Recovery Scenarios

#### Force Restart After Major Changes
```bash
# Override state tracking and restart completely
./scripts/entrypoint.sh --setup --force
```

#### Continue Despite Failures (Use with caution)
```bash
# Continue execution even if scripts fail
./scripts/entrypoint.sh --setup --continue-on-error
# Useful for development/testing scenarios
# Not recommended for stable deployments
```

## Complete Architecture Example

### Comprehensive Directory Structure
```bash
scripts/setup.d/
├── 00-bootstrap/                    # Essential initialization (always executed)
│   ├── 00-system-preparation.sh    # System updates and base packages
│   ├── 01-essential-tools.sh       # Core development tools
│   ├── parallel-checks/             # Parallel system validation
│   │   ├── .parallel                # Config: description=System Validation
│   │   ├── check-docker.sh          # Docker availability check
│   │   ├── check-git.sh             # Git configuration check
│   │   └── check-network.sh         # Network connectivity check
│   └── 99-bootstrap-completion.sh   # Bootstrap finalization
├── 10-development-packages/         # Development tool installation
│   ├── 01-package-preparation.sh    # Package manager setup
│   ├── language-runtimes/           # Parallel language installation
│   │   ├── .parallel                # Config: description=Language Runtimes
│   │   ├── install-python.sh        # Python ecosystem setup
│   │   ├── install-node.sh          # Node.js ecosystem setup
│   │   └── install-golang.sh        # Go development environment
│   └── 99-package-verification.sh   # Installation verification
├── 20-user-configuration/           # User environment setup
│   ├── 01-user-directories.sh       # Home directory structure
│   ├── 02-shell-configuration.sh    # Shell and terminal setup
│   └── 03-development-settings.sh   # IDE and editor configuration
├── 30-project-specific/             # Project customization point
│   └── (empty - for user customization)
├── 90-system-optimization/          # Performance and cleanup
│   ├── 01-cache-cleanup.sh          # Remove temporary files
│   └── 02-system-tuning.sh          # Performance optimization
└── 99-completion/                   # Finalization (always executed)
    ├── 01-system-summary.sh         # Environment status report
    └── 02-welcome-message.sh        # User welcome and guidance
```

### Resource Coordination Example
```bash
# install-python.sh.resources
package-manager
network
filesystem

# install-node.sh.resources  
package-manager
network
filesystem

# install-golang.sh.resources
network
filesystem
# Note: No package-manager conflict, can run parallel with docker setup
```

This comprehensive structure provides:
- **Clear separation of concerns** across different setup phases
- **Intelligent parallelization** where safe and beneficial
- **Resource conflict prevention** through explicit coordination
- **Extensibility points** for project-specific customization
- **Comprehensive validation** at each phase of initialization

For additional examples and troubleshooting guidance, see the [main README](../README.md) and [command cheat sheet](CHEAT-SHEET.md).
