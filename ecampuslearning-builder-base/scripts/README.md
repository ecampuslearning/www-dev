# DevContainer Setup Scripts

This directory contains the setup script system for the project. Always refer to the root documentation for consistency.

## Quick Start

```bash
# Setup with fail-fast protection (runs automatically when container starts)
./entrypoint.sh --setup

# Resume after fixing any failures
./entrypoint.sh --setup --resume

# Check scripts before running them
./entrypoint.sh --validate-only

# Normal startup (every container start - just 00-* and 99-* folders)
./entrypoint.sh
```

## DevContainer Integration

The system is **automatically integrated** with your devcontainer:

- **Container Start**: Runs `./entrypoint.sh --setup` automatically
- **Fail-Fast**: Setup stops on first error with clear guidance
- **Resume Feature**: Fix issues and resume right where you left off

## Documentation

- **[Cheat Sheet](../docs/CHEAT-SHEET.md)** - Quick commands reference
- **[Quick Reference Guide](../docs/QUICK-REFERENCE.md)** - Execution order, naming, troubleshooting  
- **[Complete Guide](../docs/SETUP-SCRIPTS.md)** - Full system documentation

## Key Features

| Feature | Description |
|-------|----------|
| Script failure handling | Stops with clear guidance on what went wrong |
| Resource coordination | Smart resource locks prevent conflicts |
| State tracking | Resume exactly where you left off |
| Validation | Check everything before running |

## Structure

- `entrypoint.sh` - Main entry point script
- `setup.d/` - Setup script folders organized by execution order
  - `00-bootstrap/` - Essential scripts (always run)
  - `99-completion/` - Finalization scripts (always run)
    - `01-welcome-summary.sh` - Shows environment summary

Add your own folders like:
  - `10-packages/` - Package installations (setup only)
  - `20-config/` - Configuration scripts (setup only)  
  - `30-user/` - User customizations (setup only)

## What Makes It Great

### Recovery & Resume
- Scripts fail → Get clear error messages
- Fix the issue → Resume with `--resume`
- State tracking → Skip scripts that already completed

### Script Validation
- Pre-flight checks with `--validate-only`
- Syntax checking and resource validation
- Checks for executable permissions

# Scripts Directory

This directory contains the core automation and orchestration scripts for the DevContainer Base project. It implements a smart script execution system with reliability features and intelligent coordination.

## Core Components

### Main Orchestration Scripts
- **`entrypoint.sh`**: Main script orchestrator with state management, validation, and resume features
- **`docker-deploy.sh`**: Smart Docker wrapper with BuildKit integration and signal handling
- **`update.sh`**: System update automation with dependency management

### Script Execution System
- **`setup.d/`**: Hierarchical setup script organization with numerical execution ordering
- **`update.d/`**: System update scripts with coordination and rollback capabilities

## Script System Architecture

### Execution Model
The script system implements a two-tier execution model optimized for reliability and performance:

#### Tier 1: Sequential Folder Processing
Folders execute in numerical order (00 → 10 → 20 → ... → 99) ensuring proper dependency management.

#### Tier 2: Mixed Execution Within Folders
- **Individual Scripts** (`.sh` files): Execute sequentially with full error tracking
- **Subfolders**: Execute in parallel with resource coordination to prevent conflicts
- **Configuration Files**: `.parallel` and `.resources` files control execution behavior

### Reliability Features
- **Fail-fast Protection**: Immediate exit on script failure with detailed error context
- **State Persistence**: JSON-based tracking enables resumption after fixing issues
- **Resource Coordination**: File-based locking prevents conflicts between parallel operations
- **Comprehensive Validation**: Pre-execution checks ensure script integrity and dependencies

## Usage Patterns

### Standard Operations
```bash
# Normal startup (essential scripts only)
./scripts/entrypoint.sh

# Complete initialization (all script folders)
./scripts/entrypoint.sh --setup

# Validation before execution
./scripts/entrypoint.sh --validate-only

# Resume after fixing failures
./scripts/entrypoint.sh --setup --resume
```

### Development and Debugging
```bash
# Force complete restart (override state tracking)
./scripts/entrypoint.sh --setup --force

# Continue despite script failures
./scripts/entrypoint.sh --setup --continue-on-error

# Enable rollback tracking for cleanup
./scripts/entrypoint.sh --setup --enable-rollback
```

## Script Development Guidelines

### Best Practices
- **Error Handling**: Use `set -euo pipefail` for robust error detection
- **Resource Declaration**: Create `.resources` files for scripts requiring shared resources
- **Descriptive Naming**: Use clear, action-oriented script names with numerical prefixes
- **Validation Logic**: Include verification steps to confirm successful execution

### Integration Points
Scripts can integrate with the broader system through:
- **Environment variables**: Access to project configuration via `.env` file
- **Configuration files**: Reference to `config/` directory for centralized settings
- **State management**: Automatic tracking via the orchestration system
- **Logging integration**: Consistent output formatting and error reporting

For detailed usage examples and troubleshooting guidance, see the [main documentation](../docs/SETUP-SCRIPTS.md).

---

**Documentation maintenance:** Always update documentation to maintain consistency across implementations.
