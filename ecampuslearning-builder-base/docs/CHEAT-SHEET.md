# DevContainer Script System - Command Cheat Sheet

## Quick Build Commands
```bash
make base          # Build stable image with Git version tagging
make base <tag>    # Build with tag (e.g., make base dev → base-dev, make base v1.0.0 → base-v1.0.0)
make clean         # Clean Docker build cache
make help          # Show all available targets
```

### Core Script System Commands
```bash
# Standard operations
./scripts/entrypoint.sh                    # Normal startup (essential scripts only)
./scripts/entrypoint.sh --setup            # Full initialization (all script folders)

# Development and troubleshooting
./scripts/entrypoint.sh --validate-only    # Comprehensive script validation
./scripts/entrypoint.sh --setup --resume   # Resume after fixing failed scripts
./scripts/entrypoint.sh --setup --force    # Override locks and restart completely
```

## VS Code DevContainer Integration

### Automatic Setup
DevContainer automatically runs the setup system on container start:
```json
{
  "postStartCommand": "bash scripts/entrypoint.sh --setup"
}
```

### Manual Control During Development
| Scenario | Command |
|----------|---------|
| **Container started automatically** | *Setup runs automatically - no action needed* |
| **Manual full setup** | `./scripts/entrypoint.sh --setup` |
| **Resume after fixing issues** | `./scripts/entrypoint.sh --setup --resume` |
| **Validate before running** | `./scripts/entrypoint.sh --validate-only` |
| **Force complete restart** | `./scripts/entrypoint.sh --setup --force` |

## Script Development Quick Start

### Create New Setup Script (Template)
```bash
# 1. Determine appropriate category and create directory
mkdir -p scripts/setup.d/10-packages/

# 2. Create script with proper structure
cat > scripts/setup.d/10-packages/install-my-tool.sh << 'EOF'
#!/bin/bash
set -euo pipefail  # Robust error handling

# Script purpose: Install and configure my development tool
echo "Installing my development tool..."

# Your installation logic here
if command -v my-tool >/dev/null 2>&1; then
    echo "my-tool already installed, skipping"
    exit 0
fi

# Installation commands
sudo apt-get update
sudo apt-get install -y my-tool

# Verification
if command -v my-tool >/dev/null 2>&1; then
    echo "my-tool installed successfully"
else
    echo "Failed to install my-tool" >&2
    exit 1
fi
EOF

# 3. Make executable
chmod +x scripts/setup.d/10-packages/install-my-tool.sh

# 4. Optional: Add resource coordination
echo -e "package-manager\nnetwork" > scripts/setup.d/10-packages/install-my-tool.sh.resources
```

### Script Categories & Naming
| Category | Purpose | Example |
|----------|---------|---------|
| `00-bootstrap/` | Essential system setup | `00-system-update.sh` |
| `10-packages/` | Development tools | `01-install-python.sh` |
| `20-configuration/` | Environment setup | `01-shell-config.sh` |
| `30-project/` | Project-specific setup | `01-project-deps.sh` |
| `99-completion/` | Finalization | `01-welcome.sh` |

## Advanced Features Summary

### Reliability & Recovery
| Feature | Behavior | Benefit |
|---------|----------|---------|
| **Fail-fast protection** | Stops immediately on script failure | Prevents cascading errors |
| **State persistence** | Tracks execution progress in JSON | Enables precise resume capability |
| **Resource coordination** | Prevents parallel script conflicts | Safe concurrent execution |
| **Pre-execution validation** | Checks scripts before running | Catches issues early |

### Execution Control Options
```bash
# Error handling modes
./scripts/entrypoint.sh --setup --fail-fast          # Stop on first error (default)
./scripts/entrypoint.sh --setup --continue-on-error  # Continue despite failures

# Output control
./scripts/entrypoint.sh --setup --quiet              # Minimal output
./scripts/entrypoint.sh --setup --silent             # Maximum suppression

# Advanced recovery
./scripts/entrypoint.sh --setup --enable-rollback    # Track rollback commands
```

### Parallel Execution Setup
```bash
# Create parallel execution folder
mkdir -p scripts/setup.d/10-packages/parallel-installs/
echo "description=Parallel Package Installation" > scripts/setup.d/10-packages/parallel-installs/.parallel

# Add coordinated scripts
echo -e "package-manager\nnetwork" > scripts/setup.d/10-packages/parallel-installs/install-python.sh.resources
echo -e "network\nfilesystem" > scripts/setup.d/10-packages/parallel-installs/install-docker.sh.resources
```

## Troubleshooting Quick Reference

### Common Recovery Scenarios
```bash
# Script failed - standard recovery
./scripts/entrypoint.sh --validate-only  # Check what's wrong
# Fix the issue, then:
./scripts/entrypoint.sh --setup --resume # Resume from failure point

# Major changes made - force restart
./scripts/entrypoint.sh --setup --force  # Override state tracking

# Development/testing - continue despite errors
./scripts/entrypoint.sh --setup --continue-on-error
```

For comprehensive documentation, see [SETUP-SCRIPTS.md](SETUP-SCRIPTS.md) and [QUICK-REFERENCE.md](QUICK-REFERENCE.md).
