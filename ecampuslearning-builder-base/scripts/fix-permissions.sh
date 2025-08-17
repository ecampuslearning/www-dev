#!/bin/bash
set -euo pipefail

# Script to fix permissions in the repository
# Make only shell scripts executable and remove executable permissions from other files

# Function to show usage
show_usage() {
  echo "Usage: $(basename "$0") [OPTIONS]"
  echo ""
  echo "Options:"
  echo "  -g, --fix-git-perms  Fix permissions in the .git directory"
  echo "  -h, --help           Show this help message"
  echo ""
  echo "Description:"
  echo "  This script fixes file permissions in the repository:"
  echo "  - Removes executable permissions from all files"
  echo "  - Makes only shell scripts (*.sh) executable"
  echo "  - Behavior changes based on location:"
  echo "    - In scripts/: Ignores .git and .devcontainer directories by default"
  echo "    - In .devcontainer/scripts/: Only fixes permissions within .devcontainer"
  echo "  - Optionally fixes permissions in the .git directory"
}

# Default: don't modify .git permissions
FIX_GIT_PERMS=false

# Process command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -g|--fix-git-perms)
      FIX_GIT_PERMS=true
      shift
      ;;
    -h|--help)
      show_usage
      exit 0
      ;;
    *)
      # Unknown option
      shift
      ;;
  esac
done

# Determine script location and set behavior accordingly
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_PATH="$(realpath "$SCRIPT_DIR")"

# Check if script is running from .devcontainer/scripts
if [[ "$SCRIPT_PATH" == *"/.devcontainer/scripts"* ]]; then
  # Running from .devcontainer/scripts - only fix permissions within .devcontainer
  echo "Running from .devcontainer/scripts - only fixing permissions within .devcontainer"
  DEVCONTAINER_DIR="$(dirname "$SCRIPT_DIR")"
  
  echo "Fixing permissions in: $DEVCONTAINER_DIR"
  
  # 1. Remove executable permissions from all files in .devcontainer (except .git if it exists)
  echo "Removing executable permissions from .devcontainer files..."
  find "$DEVCONTAINER_DIR" -type f -not -path "*/\.git/*" -exec chmod -x {} \;
  
  # 2. Fix .git directory inside .devcontainer if requested
  if [ "$FIX_GIT_PERMS" = true ] && [ -d "$DEVCONTAINER_DIR/.git" ]; then
    echo "Fixing .git directory permissions within .devcontainer..."
    
    # Remove executable permissions from all files in .git
    echo "  Removing executable permissions from .git files..."
    find "$DEVCONTAINER_DIR/.git" -type f -exec chmod -x {} \;
    
    # Add executable permissions to hooks and other scripts that need it
    echo "  Adding executable permissions to git hooks..."
    find "$DEVCONTAINER_DIR/.git/hooks" -type f -not -name "*.sample" -exec chmod +x {} \; 2>/dev/null || true
    
    # Make sure git-related scripts are executable
    echo "  Checking for specific git hooks to make executable..."
    for hook in post-update pre-push pre-commit pre-receive update; do
      if [ -f "$DEVCONTAINER_DIR/.git/hooks/$hook" ]; then 
        echo "    Making $DEVCONTAINER_DIR/.git/hooks/$hook executable"
        chmod +x "$DEVCONTAINER_DIR/.git/hooks/$hook"
      fi
    done
    
    echo "✓ Git permissions within .devcontainer fixed"
  elif [ -d "$DEVCONTAINER_DIR/.git" ]; then
    echo "Skipping .git directory within .devcontainer (use -g or --fix-git-perms to fix Git permissions)"
  fi
  
  # 3. Selectively add executable permissions only to shell scripts in .devcontainer
  echo "Adding executable permissions to shell scripts in .devcontainer only..."
  find "$DEVCONTAINER_DIR" -type f -name "*.sh" -exec chmod +x {} \;
  
  echo "✓ Permission fixes complete! Only shell scripts in .devcontainer have executable permissions now."
  echo ""
  echo "Usage information:"
  echo "  $(basename "$0")             # Fix permissions in .devcontainer, skip .git directory"
  echo "  $(basename "$0") -g          # Fix permissions in .devcontainer, including .git directory"
else
  # Running from scripts/ - normal behavior ignoring .devcontainer
  echo "Fixing permissions in the repository..."

  # 1. First, remove executable permissions from everything (except .git and .devcontainer by default)
  echo "Removing executable permissions from all files..."
  find . -type f -not -path "*/\.git/*" -not -path "*/\.devcontainer/*" -exec chmod -x {} \;

  # 2. Fix .git directory permissions if requested
  if [ "$FIX_GIT_PERMS" = true ] && [ -d ".git" ]; then
      echo "Fixing .git directory permissions..."
      echo "  Found .git directory at $(pwd)/.git"
      
      # Remove executable permissions from all files in .git
      echo "  Removing executable permissions from .git files..."
      find .git -type f -exec chmod -x {} \;
      
      # Add executable permissions to hooks and other scripts that need it
      echo "  Adding executable permissions to git hooks..."
      find .git/hooks -type f -not -name "*.sample" -exec chmod +x {} \; 2>/dev/null || true
      
      # Make sure git-related scripts are executable
      echo "  Checking for specific git hooks to make executable..."
      for hook in post-update pre-push pre-commit pre-receive update; do
          if [ -f ".git/hooks/$hook" ]; then 
              echo "    Making .git/hooks/$hook executable"
              chmod +x ".git/hooks/$hook"
          fi
      done
      
      echo "✓ Git permissions fixed"
  else
      echo "Skipping .git directory (use -g or --fix-git-perms to fix Git permissions)"
  fi

  # 3. Then, selectively add executable permissions only to shell scripts (excluding .devcontainer)
  echo "Adding executable permissions to shell scripts only..."
  find . -type f -name "*.sh" -not -path "*/\.devcontainer/*" -exec chmod +x {} \;

  echo "✓ Permission fixes complete! Only shell scripts have executable permissions now."
  echo ""
  echo "Usage information:"
  echo "  ./fix-permissions.sh             # Fix permissions, skip .git and .devcontainer directories"
  echo "  ./fix-permissions.sh -g          # Fix permissions, also fix .git directory (still skips .devcontainer)"
fi