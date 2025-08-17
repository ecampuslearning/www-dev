# Configuration Directory

This directory contains configuration files and templates for the DevContainer Base project. It's a centralized spot for environment-specific settings, service configurations, and customizable templates.

## What Goes Here

### Types of Configuration Files
- **Environment configs**: Service and application settings
- **Tool configurations**: Development tool setup (linting, formatting, etc.)
- **Template files**: Reusable config templates for common scenarios
- **Shell configurations**: Bash, Zsh, and other shell customization files

### How to Use These
- **Direct reference**: Scripts can source configs from this directory
- **Template expansion**: Config templates can be customized during setup
- **Environment overrides**: Settings can be overridden via `.env` file in project root
- **Service integration**: External services can reference configs from here

## Integration with Script System

Setup scripts in `scripts/setup.d/` can reference config files from this directory using relative paths. This keeps configuration centralized while maintaining script modularity.

---

**Note on maintenance:** Always update docs to keep everything consistent.
