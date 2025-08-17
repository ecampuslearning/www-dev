# Complete Quick Reference - DevContainer Base

## Build System Commands

### Primary Makefile Operations
```bash
make base          # Build stable image with Git version tagging
make base <tag>    # Build with tag (e.g., make base dev → base-dev, make base v1.0.0 → base-v1.0.0)
make clean         # Clean Docker build cache and temporary artifacts  
make help          # Display all available targets and usage information
```

### Advanced Docker Operations
```bash
# Direct docker-deploy.sh usage for advanced scenarios
./scripts/docker-deploy.sh build --tag custom:latest -f deployments/Dockerfile.base .
./scripts/docker-deploy.sh compose up -d  # Multi-container scenarios
```

## Script System Command Reference

### Essential Operations
```bash
# Standard execution modes
./scripts/entrypoint.sh                           # Normal startup (essential scripts only)
./scripts/entrypoint.sh --setup                   # Full initialization (all folders)

# Development and debugging
./scripts/entrypoint.sh --validate-only           # Comprehensive script validation
./scripts/entrypoint.sh --setup --resume          # Resume from last failure point
./scripts/entrypoint.sh --setup --force           # Override state tracking and restart
```

### Advanced Execution Control
```bash
# Error handling strategies
./scripts/entrypoint.sh --setup --fail-fast               # Stop on first error (default)
./scripts/entrypoint.sh --setup --continue-on-error       # Continue despite script failures

# Output and logging control
./scripts/entrypoint.sh --setup --quiet                   # Suppress non-essential output
./scripts/entrypoint.sh --setup --silent                  # Maximum output suppression

# Recovery and rollback features
./scripts/entrypoint.sh --setup --enable-rollback         # Track rollback commands
./scripts/entrypoint.sh --setup --resume --enable-rollback # Resume with rollback tracking
```

## System Architecture Overview

### Reliability Engineering Features
| Feature | Implementation | Benefit |
|---------|----------------|---------|
| **Fail-safe execution** | Exit codes monitored with detailed error reporting | Prevents cascading failures and unclear states |
| **Resource coordination** | File-based locking with dependency awareness | Enables safe parallel script execution |
| **State persistence** | JSON tracking with script-level granularity | Precise resumption after fixing issues |
| **Comprehensive validation** | Pre-execution dependency and syntax checking | Early detection of configuration problems |

### Execution Architecture
The script system implements a sophisticated two-tier execution model optimized for both reliability and performance.

## Script Execution Model

### Tier 1: Sequential Folder Processing
Folders execute in strict numerical order ensuring proper dependency management:
```
00-bootstrap/ → 10-packages/ → 20-configuration/ → 30-project/ → ... → 99-completion/
```

### Tier 2: Mixed Execution Within Folders
Each folder supports flexible execution patterns:

#### Individual Scripts (`.sh` files)
- Execute sequentially in alphanumeric order
- Full error checking and state tracking
- Resource coordination when specified

#### Parallel Subfolders
- All subfolders within a numbered folder execute concurrently
- Resource coordination prevents conflicts
- Configurable via `.parallel` files

### Execution Flow Example
```bash
# Example: scripts/setup.d/10-packages/
├── 01-preparation.sh           # Executes first (sequential)
├── parallel-installs/          # Parallel execution group
│   ├── .parallel               # Config: description=Package Installation  
│   ├── install-python.sh       # } Coordinated
│   ├── install-node.sh         # } parallel
│   └── install-docker.sh       # } execution  
├── language-tools/             # Another parallel group
│   ├── setup-linting.sh        # } Parallel with
│   └── setup-formatting.sh     # } above group
└── 99-verification.sh          # Executes last (sequential)
```

## Naming Conventions & Organization

### Folder Naming Patterns
Folders use numerical prefixes to control execution order:
- **Format**: `XX-descriptive-name/` (e.g., `00-bootstrap/`, `10-packages/`)
- **Range**: 00-99 with logical groupings for different setup phases

### Script Naming Patterns  
Scripts within folders follow alphanumeric ordering:
- **Format**: `XX-descriptive-name.sh` (e.g., `01-system-update.sh`, `02-install-tools.sh`)
- **Special Files**: `.parallel` files configure parallel subfolder execution
- **Resource Files**: `.resources` files define coordination requirements

### Standard Folder Categories
| Range | Category | Purpose | Examples |
|-------|----------|---------|----------|
| `00-XX` | **Bootstrap** | Essential system initialization | `00-bootstrap/`, `01-system-prep/` |
| `10-XX` | **Packages** | Development tool installation | `10-packages/`, `11-language-runtimes/` |
| `20-XX` | **Configuration** | Environment and tool setup | `20-configuration/`, `21-user-settings/` |
| `30-XX` | **Project** | Project-specific customization | `30-project/`, `31-workspace-setup/` |
| `80-XX` | **Optimization** | Performance and cleanup | `80-optimization/`, `81-cache-setup/` |
| `90-XX` | **Cleanup** | Temporary file removal | `90-cleanup/`, `91-package-cleanup/` |
| `99-XX` | **Completion** | Finalization and reporting | `99-completion/`, `99-welcome/` |

## Complete Architecture Example

### Complete Directory Structure
```bash
scripts/setup.d/
├── 00-bootstrap/                           # Essential initialization (always executed)
│   ├── 00-system-updates.sh               # Critical system updates
│   ├── 01-base-packages.sh                # Essential system packages
│   ├── system-validation/                 # Parallel system checks
│   │   ├── .parallel                      # Config: description=System Verification
│   │   ├── check-docker.sh                # Docker daemon verification
│   │   ├── check-git.sh                   # Git configuration validation
│   │   ├── check-network.sh               # Network connectivity test
│   │   └── check-permissions.sh           # File system permissions
│   └── 99-bootstrap-complete.sh           # Bootstrap completion marker
├── 10-development-packages/               # Development environment setup
│   ├── 01-package-manager-setup.sh        # Configure package managers
│   ├── language-runtimes/                 # Parallel language installation
│   │   ├── .parallel                      # Config: description=Language Runtimes
│   │   ├── install-python.sh              # Python ecosystem (pip, venv, etc.)
│   │   ├── install-python.sh.resources    # Resources: package-manager, network
│   │   ├── install-nodejs.sh              # Node.js ecosystem (npm, yarn, etc.)
│   │   ├── install-nodejs.sh.resources    # Resources: package-manager, network
│   │   ├── install-golang.sh              # Go development environment
│   │   └── install-golang.sh.resources    # Resources: network, filesystem
│   ├── developer-tools/                   # Parallel tool installation
│   │   ├── .parallel                      # Config: description=Developer Tools
│   │   ├── install-git-tools.sh           # Git extensions and helpers
│   │   ├── install-editors.sh             # CLI editors and plugins
│   │   └── install-debugging-tools.sh     # Debugging and profiling tools
│   └── 99-package-verification.sh         # Verify all installations
├── 20-user-configuration/                 # User environment customization
│   ├── 01-create-directories.sh           # User directory structure
│   ├── 02-shell-configuration.sh          # Shell profiles and aliases
│   ├── 03-editor-configuration.sh         # Editor settings and plugins
│   ├── personalization/                   # Parallel user customization
│   │   ├── .parallel                      # Config: description=User Personalization
│   │   ├── setup-dotfiles.sh              # Personal dotfile configuration
│   │   ├── setup-ssh-keys.sh              # SSH key management
│   │   └── setup-git-config.sh            # Personal Git configuration
│   └── 99-user-env-complete.sh            # User environment verification
├── 30-project-customization/              # Project-specific setup (empty by default)
│   └── README.md                          # Instructions for project customization
├── 80-system-optimization/                # Performance and resource optimization
│   ├── 01-cleanup-temp-files.sh           # Remove installation temporary files
│   ├── 02-optimize-docker.sh              # Docker daemon optimization
│   └── 03-system-tuning.sh                # General system performance tuning
└── 99-completion/                         # Finalization (always executed)
    ├── 01-environment-summary.sh          # Comprehensive environment report
    ├── 02-validation-report.sh            # Installation verification summary
    └── 03-welcome-message.sh              # User guidance and next steps
```

### Resource Coordination Examples
```bash
# Example: install-python.sh.resources
package-manager
network
filesystem

# Example: install-nodejs.sh.resources  
package-manager
network
filesystem

# Example: install-docker.sh.resources (can run parallel with Python/Node)
network
filesystem
systemd
# Note: No package-manager conflict allows parallel execution
```

### Parallel Configuration Examples
```bash
# .parallel file in language-runtimes/
description=Installing Language Runtime Environments
max_concurrent=3
timeout=600

# .parallel file in developer-tools/
description=Installing Developer Tools and Utilities
max_concurrent=5
timeout=300
```

This architecture provides:
- **Logical separation** of concerns across setup phases
- **Optimized performance** through intelligent parallelization  
- **Conflict prevention** via explicit resource coordination
- **Extensibility** through clear customization points
- **Comprehensive validation** at each phase transition
- **Reliable operation** with robust error handling and recovery

For implementation examples and troubleshooting, see [SETUP-SCRIPTS.md](SETUP-SCRIPTS.md) and [CHEAT-SHEET.md](CHEAT-SHEET.md).
