#!/bin/bash

# DevContainer setup entrypoint: reliable, resumable, and validates scripts.
#
# Features:
# - Fail-fast or continue-on-error execution
# - State persistence for resume
# - Script validation before execution
# - Error reporting and optional rollback tracking
#
# Usage:
#   entrypoint.sh [--setup] [--resume] [--validate-only] [--enable-rollback] [--fail-fast|--continue-on-error] ...
#
#   --setup           Run full setup (all folders)
#   --resume          Resume from last successful point
#   --validate-only   Validate scripts without running
#   --enable-rollback Track rollback commands
#   --fail-fast       Stop on first error (default)
#   --continue-on-error Continue on errors
#   --quiet|-q        Suppress output
#   --silent          Suppress output and parallel logs
#   --force           Force rerun even if lock exists
#
# See README.md for more details.

# Color definitions
BASE03='\033[1;30m'
BASE01='\033[1;32m'
BASE00='\033[1;33m'
BASE0='\033[1;34m'
BASE1='\033[1;36m'
YELLOW='\033[0;33m'
RED='\033[1;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
BOLD='\033[1m'
NC='\033[0m'

# Semantic color variables
INFO_COLOR="$BASE1"
SUCCESS_COLOR="$GREEN"
HEADER_COLOR="$BLUE"
EMPHASIS_COLOR='\033[1;35m'
WARNING_COLOR="$YELLOW"
ERROR_COLOR="$RED"
MUTED_COLOR="$BASE01"

# Load .env variables if present
if [ -n "$WORKSPACE_DIR" ] && [ -f "$WORKSPACE_DIR/.env" ]; then
  set -a
  # shellcheck disable=SC1091
  . "$WORKSPACE_DIR/.env"
  set +a
fi

# Parse --force and clean args
FORCE_SETUP=false
CLEANED_ARGS=()
for arg in "$@"; do
  if [ "$arg" = "--force" ]; then
    FORCE_SETUP=true
    continue
  fi
  CLEANED_ARGS+=("$arg")
done
set -- "${CLEANED_ARGS[@]}"

# Option flags
RUN_SETUP=false
QUIET_MODE=false
SUPPRESS_PARALLEL=false
LOG_PARALLEL=false
SHOW_WELCOME_IN_QUIET=false
WELCOME_ONLY=false
FAIL_FAST=true
ENABLE_ROLLBACK=false
RESUME_MODE=false
VALIDATE_ONLY=false

# Argument parsing
for arg in "$@"; do
  case $arg in
    --setup) RUN_SETUP=true; shift ;;
    --startup) shift ;;
    --welcome-only) WELCOME_ONLY=true; shift ;;
    --quiet|-q) QUIET_MODE=true; shift ;;
    --quiet-with-welcome) QUIET_MODE=true; SHOW_WELCOME_IN_QUIET=true; shift ;;
    --suppress-parallel|-s) SUPPRESS_PARALLEL=true; shift ;;
    --log-parallel|-l) LOG_PARALLEL=true; shift ;;
    --silent) QUIET_MODE=true; SUPPRESS_PARALLEL=true; shift ;;
    --continue-on-error) FAIL_FAST=false; shift ;;
    --fail-fast) FAIL_FAST=true; shift ;;
    --enable-rollback) ENABLE_ROLLBACK=true; shift ;;
    --resume) RESUME_MODE=true; shift ;;
    --validate-only) VALIDATE_ONLY=true; shift ;;
    *) echo "Unknown argument: $arg" >&2; exit 1 ;;
  esac
done

# Prevent double execution with a lock file (for --setup)
if [ "$RUN_SETUP" = true ]; then
    LOCK_FILE="/tmp/devcontainer-setup.lock"
    if [ -f "$LOCK_FILE" ] && [ "$FORCE_SETUP" != true ]; then
        echo "Setup already ran, skipping duplicate execution. Use --force to rerun."
        exit 0
    fi
    touch "$LOCK_FILE"
fi

export RUN_SETUP QUIET_MODE SHOW_WELCOME_IN_QUIET FAIL_FAST

# State management paths
WORKSPACE_DIR="${WORKSPACE_DIR}"
STATE_DIR="$WORKSPACE_DIR/.devcontainer/.local/.state"
STATE_FILE="$STATE_DIR/setup-state.json"
LOCK_DIR="$STATE_DIR/locks"
ROLLBACK_DIR="$STATE_DIR/rollback"

# Initialize state tracking files and directories
init_state_management() {
    mkdir -p "$STATE_DIR" "$LOCK_DIR" "$ROLLBACK_DIR"
    if [ ! -f "$STATE_FILE" ]; then
        cat > "$STATE_FILE" << 'EOF'
{
  "version": "2.0",
  "started_at": null,
  "completed_folders": [],
  "failed_folders": [],
  "completed_scripts": [],
  "failed_scripts": [],
  "last_run": null,
  "status": "fresh"
}
EOF
    fi
}

# Update a key in the state file
update_state() {
    local key="$1"
    local value="$2"
    local temp_file=$(mktemp)
    if command -v jq >/dev/null 2>&1; then
        jq --arg key "$key" --arg value "$value" '.[$key] = $value' "$STATE_FILE" > "$temp_file"
        mv -f "$temp_file" "$STATE_FILE"
    else
        sed "s/\"$key\": \"[^\"]*\"/\"$key\": \"$value\"/" "$STATE_FILE" > "$temp_file"
        mv -f "$temp_file" "$STATE_FILE"
    fi
}

# Add a completed folder or script to state
add_to_completed() {
    local type="$1"
    local name="$2"
    local temp_file=$(mktemp)
    if command -v jq >/dev/null 2>&1; then
        local key="completed_${type}s"
        jq --arg key "$key" --arg name "$name" '.[$key] += [$name]' "$STATE_FILE" > "$temp_file"
        mv -f "$temp_file" "$STATE_FILE"
    else
        echo "Note: jq not available, state tracking limited" >&2
    fi
}

# Check if a folder or script is already completed
is_completed() {
    local type="$1"
    local name="$2"
    if command -v jq >/dev/null 2>&1; then
        local key="completed_${type}s"
        jq -r --arg key "$key" --arg name "$name" '.[$key] | contains([$name])' "$STATE_FILE" 2>/dev/null | grep -q "true"
    else
        return 1
    fi
}

# Validate a script: existence, executable, and syntax
validate_script() {
    local script="$1"
    local errors=0
    if [ ! -f "$script" ]; then
        echo -e "${ERROR_COLOR}✗ Script not found: $script${NC}" >&2
        return 1
    fi
    if [ ! -x "$script" ]; then
        echo -e "${ERROR_COLOR}✗ Script not executable: $script${NC}" >&2
        errors=$((errors + 1))
    fi
    if ! bash -n "$script" 2>/dev/null; then
        echo -e "${ERROR_COLOR}✗ Syntax error in script: $script${NC}" >&2
        errors=$((errors + 1))
    fi
    return $errors
}

# Execute a script with error handling, validation, and optional rollback
execute_script() {
    local script="$1"
    local script_name=$(basename "$script")
    local script_dir=$(dirname "$script")
    local script_base=$(basename "$script" .sh)
    # Resume mode: skip completed scripts
    if [ "$RESUME_MODE" = true ] && is_completed "script" "$script_name"; then
        [ "$QUIET_MODE" = false ] && echo -e "${SUCCESS_COLOR}✓ Skipping completed: $script_name${NC}"
        return 0
    fi
    # Validate before running
    if ! validate_script "$script"; then
        echo -e "${ERROR_COLOR}✗ Script validation failed: $script_name${NC}" >&2
        [ "$FAIL_FAST" = true ] && echo -e "${ERROR_COLOR}Stopping due to validation failure (fail-fast mode)${NC}" >&2 && exit 1
        return 1
    fi
    # Prepare rollback script if enabled
    if [ "$ENABLE_ROLLBACK" = true ]; then
        local rollback_script="$ROLLBACK_DIR/rollback_${script_base}_$(date +%s).sh"
        cat > "$rollback_script" << EOF
#!/bin/bash
# Rollback for $script_name - Generated at $(date)
echo "Rolling back $script_name..."
# Script should append rollback commands to \$ROLLBACK_SCRIPT
EOF
        chmod +x "$rollback_script"
        export ROLLBACK_SCRIPT="$rollback_script"
    fi
    local exit_code=0
    [ "$QUIET_MODE" = false ] && echo -e "${WARNING_COLOR}▶ Running:${NC} ${BOLD}$script_name${NC}"
    if [ "$QUIET_MODE" = true ]; then
        bash "$script" >/dev/null 2>&1
        exit_code=$?
    else
        bash "$script"
        exit_code=$?
    fi
    if [ $exit_code -eq 0 ]; then
        add_to_completed "script" "$script_name"
        [ "$QUIET_MODE" = false ] && echo -e "${SUCCESS_COLOR}✓ $script_name completed successfully${NC}"
    else
        echo -e "${ERROR_COLOR}✗ $script_name failed with exit code $exit_code${NC}" >&2
        update_state "status" "failed"
        if [ "$FAIL_FAST" = true ]; then
            echo -e "${ERROR_COLOR}Stopping execution due to script failure (fail-fast mode)${NC}" >&2
            echo -e "${MUTED_COLOR}Use --continue-on-error to change this behavior${NC}" >&2
            echo -e "${MUTED_COLOR}Use --resume to continue from this point after fixing the issue${NC}" >&2
            exit $exit_code
        fi
    fi
    return $exit_code
}

# Run all scripts in a subfolder in parallel, with error handling
execute_parallel_scripts() {
    local subfolder="$1"
    local subfolder_name=$(basename "$subfolder")
    local parallel_scripts=()
    local pids=()
    local exit_codes=()
    for script in "$subfolder"/*.sh; do
        [ -f "$script" ] && [ -x "$script" ] && parallel_scripts+=("$script")
    done
    [ ${#parallel_scripts[@]} -eq 0 ] && echo -e "${WARNING_COLOR}No executable scripts found in $subfolder_name${NC}" && return 0
    [ "$QUIET_MODE" = false ] && echo -e "${INFO_COLOR}Starting ${#parallel_scripts[@]} scripts in parallel${NC}"
    for script in "${parallel_scripts[@]}"; do
        local script_name=$(basename "$script")
        if [ "$RESUME_MODE" = true ] && is_completed "script" "$script_name"; then
            [ "$QUIET_MODE" = false ] && echo -e "${SUCCESS_COLOR}✓ Skipping completed: $script_name${NC}"
            continue
        fi
        [ "$QUIET_MODE" = false ] && echo -e "${CYAN}▷ Starting: ${BOLD}$script_name${NC}"
        (
            if [ "$SUPPRESS_PARALLEL" = true ] || [ "$QUIET_MODE" = true ]; then
                execute_script "$script" >/dev/null 2>&1
                echo $? > "$STATE_DIR/parallel_exit_${script_name}_$$"
            else
                execute_script "$script"
                echo $? > "$STATE_DIR/parallel_exit_${script_name}_$$"
            fi
        ) &
        pids+=($!)
    done
    local overall_exit_code=0
    for i in "${!pids[@]}"; do
        local pid=${pids[$i]}
        wait $pid
        local script_name=$(basename "${parallel_scripts[$i]}")
        local exit_file="$STATE_DIR/parallel_exit_${script_name}_$$"
        if [ -f "$exit_file" ]; then
            local script_exit=$(cat "$exit_file")
            rm -f "$exit_file"
            if [ "$script_exit" -ne 0 ]; then
                overall_exit_code=1
                if [ "$FAIL_FAST" = true ]; then
                    echo -e "${ERROR_COLOR}Parallel execution failed in $subfolder_name${NC}" >&2
                    break
                fi
            fi
        fi
    done
    return $overall_exit_code
}

# Validation-only mode: check all scripts for errors, don't run them
if [ "$VALIDATE_ONLY" = true ]; then
    echo -e "${HEADER_COLOR}Validating setup scripts...${NC}"
    SETUP_DIR="$WORKSPACE_DIR/.devcontainer/scripts/setup.d"
    if [ ! -d "$SETUP_DIR" ]; then
        echo -e "${ERROR_COLOR}Setup directory not found: $SETUP_DIR${NC}" >&2
        exit 1
    fi
    validation_errors=0
    total_scripts=0
    for folder in "$SETUP_DIR"/*/; do
        if [ -d "$folder" ]; then
            folder_name=$(basename "$folder")
            echo -e "${INFO_COLOR}Validating folder: $folder_name${NC}"
            for script in "$folder"*.sh; do
                if [ -f "$script" ]; then
                    total_scripts=$((total_scripts + 1))
                    if ! validate_script "$script"; then
                        validation_errors=$((validation_errors + 1))
                    else
                        echo -e "${SUCCESS_COLOR}  ✓ $(basename "$script")${NC}"
                    fi
                fi
            done
            for subfolder in "$folder"*/; do
                if [ -d "$subfolder" ]; then
                    subfolder_name=$(basename "$subfolder")
                    echo -e "${MUTED_COLOR}  Parallel folder: $subfolder_name${NC}"
                    for script in "$subfolder"*.sh; do
                        if [ -f "$script" ]; then
                            total_scripts=$((total_scripts + 1))
                            if ! validate_script "$script"; then
                                validation_errors=$((validation_errors + 1))
                            else
                                echo -e "${SUCCESS_COLOR}    ✓ $(basename "$script")${NC}"
                            fi
                        fi
                    done
                fi
            done
        fi
    done
    echo -e "\n${INFO_COLOR}Validation Summary:${NC}"
    echo -e "  Total scripts: $total_scripts"
    echo -e "  Errors: $validation_errors"
    if [ $validation_errors -eq 0 ]; then
        echo -e "${SUCCESS_COLOR}All scripts validated successfully${NC}"
        exit 0
    else
        echo -e "${ERROR_COLOR}Validation failed with $validation_errors errors${NC}" >&2
        exit 1
    fi
fi

# Main execution logic
init_state_management
update_state "started_at" "$(date -Iseconds)"
update_state "status" "running"

echo -e "${INFO_COLOR}DevContainer Setup System${NC}"
[ "$FAIL_FAST" = true ] && echo -e "${SUCCESS_COLOR}Fail-fast mode: ON${NC} (--continue-on-error to disable)" || echo -e "${WARNING_COLOR}Continue-on-error mode: ON${NC}"
[ "$RESUME_MODE" = true ] && echo -e "${SUCCESS_COLOR}Resume mode: ON${NC}"
[ "$ENABLE_ROLLBACK" = true ] && echo -e "${SUCCESS_COLOR}Rollback tracking: ON${NC}"

if [ "$RUN_SETUP" = true ]; then
    SETUP_DIR="$WORKSPACE_DIR/.devcontainer/scripts/setup.d"
    if [ ! -d "$SETUP_DIR" ]; then
        echo -e "${WARNING_COLOR}Creating setup scripts directory at: $SETUP_DIR${NC}"
        mkdir -p "$SETUP_DIR"
    fi
    if [ -d "$SETUP_DIR" ] && [ "$(ls -A "$SETUP_DIR" 2>/dev/null)" ]; then
        echo -e "${HEADER_COLOR}Running setup script folders from: $SETUP_DIR${NC}"
        for folder in "$SETUP_DIR"/*/; do
            if [ -d "$folder" ]; then
                folder_name=$(basename "$folder")
                if [ "$RESUME_MODE" = true ] && is_completed "folder" "$folder_name"; then
                    echo -e "${SUCCESS_COLOR}✓ Skipping completed folder: $folder_name${NC}"
                    continue
                fi
                echo -e "\n${EMPHASIS_COLOR}Running folder: ${BOLD}$folder_name${NC}"
                items=()
                for item in "$folder"*; do
                    if [ -f "$item" ] && [ -x "$item" ] && [[ "$item" == *.sh ]]; then
                        items+=("$item")
                    elif [ -d "$item" ]; then
                        items+=("$item")
                    fi
                done
                if [ ${#items[@]} -gt 0 ]; then
                    IFS=$'\n' items=($(sort <<<"${items[*]}"))
                    echo -e "${INFO_COLOR}Found ${#items[@]} items in $folder_name${NC}"
                    folder_success=true
                    for item in "${items[@]}"; do
                        if [ -f "$item" ]; then
                            if ! execute_script "$item"; then
                                folder_success=false
                                [ "$FAIL_FAST" = true ] && exit 1
                            fi
                        elif [ -d "$item" ]; then
                            subfolder_name=$(basename "$item")
                            parallel_config="$item/.parallel"
                            parallel_description="$subfolder_name"
                            if [ -f "$parallel_config" ] && grep -q "^description=" "$parallel_config"; then
                                parallel_description=$(grep "^description=" "$parallel_config" | cut -d'=' -f2- | sed 's/^["'\'']//' | sed 's/["'\'']$//')
                            fi
                            [ "$QUIET_MODE" = false ] && echo -e "${YELLOW}Running parallel: $parallel_description${NC}"
                            if ! execute_parallel_scripts "$item"; then
                                folder_success=false
                                [ "$FAIL_FAST" = true ] && exit 1
                            fi
                        fi
                    done
                    if [ "$folder_success" = true ]; then
                        add_to_completed "folder" "$folder_name"
                        echo -e "${SUCCESS_COLOR}Folder ${BOLD}$folder_name${NC} ${SUCCESS_COLOR}complete${NC}"
                    else
                        echo -e "${ERROR_COLOR}Folder $folder_name had failures${NC}"
                    fi
                else
                    echo -e "${WARNING_COLOR}No items found in $folder_name${NC}"
                fi
            fi
        done
    else
        echo -e "${WARNING_COLOR}No setup script folders found in: $SETUP_DIR${NC}"
    fi
    update_state "status" "completed"
    echo -e "\n${SUCCESS_COLOR}Setup complete!${NC}"
elif [ "$WELCOME_ONLY" = true ]; then
    WELCOME_SCRIPT="$WORKSPACE_DIR/.devcontainer/scripts/setup.d/99-completion/01-welcome-summary.sh"
    if [ -f "$WELCOME_SCRIPT" ] && [ -x "$WELCOME_SCRIPT" ]; then
        bash "$WELCOME_SCRIPT"
    else
        echo -e "${WARNING_COLOR}Welcome script not found or not executable: $WELCOME_SCRIPT${NC}"
    fi
else
    echo -e "${INFO_COLOR}Startup mode - running essential folders only${NC}"
    SETUP_DIR="$WORKSPACE_DIR/.devcontainer/scripts/setup.d"
    if [ ! -d "$SETUP_DIR" ]; then
        echo -e "${WARNING_COLOR}Setup directory not found: $SETUP_DIR${NC}"
    elif [ -d "$SETUP_DIR" ] && [ "$(ls -A "$SETUP_DIR" 2>/dev/null)" ]; then
        echo -e "${HEADER_COLOR}Running startup script folders from: $SETUP_DIR${NC}"
        for folder in "$SETUP_DIR"/*/; do
            if [ -d "$folder" ]; then
                folder_name=$(basename "$folder")
                if [[ "$folder_name" == 00-* ]] || [[ "$folder_name" == 99-* ]]; then
                    if [ "$RESUME_MODE" = true ] && is_completed "folder" "$folder_name"; then
                        echo -e "${SUCCESS_COLOR}✓ Skipping completed folder: $folder_name${NC}"
                        continue
                    fi
                    echo -e "\n${EMPHASIS_COLOR}Running startup folder: ${BOLD}$folder_name${NC}"
                    items=()
                    for item in "$folder"*; do
                        if [ -f "$item" ] && [ -x "$item" ] && [[ "$item" == *.sh ]]; then
                            items+=("$item")
                        elif [ -d "$item" ]; then
                            items+=("$item")
                        fi
                    done
                    if [ ${#items[@]} -gt 0 ]; then
                        IFS=$'\n' items=($(sort <<<"${items[*]}"))
                        echo -e "${INFO_COLOR}Found ${#items[@]} items in $folder_name${NC}"
                        folder_success=true
                        for item in "${items[@]}"; do
                            if [ -f "$item" ]; then
                                if ! execute_script "$item"; then
                                    folder_success=false
                                    [ "$FAIL_FAST" = true ] && exit 1
                                fi
                            elif [ -d "$item" ]; then
                                subfolder_name=$(basename "$item")
                                parallel_config="$item/.parallel"
                                parallel_description="$subfolder_name"
                                if [ -f "$parallel_config" ] && grep -q "^description=" "$parallel_config"; then
                                    parallel_description=$(grep "^description=" "$parallel_config" | cut -d'=' -f2- | sed 's/^["'\'']//' | sed 's/["'\'']$//')
                                fi
                                [ "$QUIET_MODE" = false ] && echo -e "${YELLOW}Running parallel: $parallel_description${NC}"
                                if ! execute_parallel_scripts "$item"; then
                                    folder_success=false
                                    [ "$FAIL_FAST" = true ] && exit 1
                                fi
                            fi
                        done
                        if [ "$folder_success" = true ]; then
                            add_to_completed "folder" "$folder_name"
                            echo -e "${SUCCESS_COLOR}Folder ${BOLD}$folder_name${NC} ${SUCCESS_COLOR}complete${NC}"
                        else
                            echo -e "${ERROR_COLOR}Folder $folder_name had failures${NC}"
                        fi
                    else
                        echo -e "${WARNING_COLOR}No items found in $folder_name${NC}"
                    fi
                fi
            fi
        done
        update_state "status" "startup_completed"
        echo -e "\n${SUCCESS_COLOR}Startup complete${NC}"
    else
        echo -e "${WARNING_COLOR}No setup script folders found in: $SETUP_DIR${NC}"
        WELCOME_SCRIPT="$WORKSPACE_DIR/.devcontainer/scripts/setup.d/99-completion/01-welcome-summary.sh"
        if [ -f "$WELCOME_SCRIPT" ] && [ -x "$WELCOME_SCRIPT" ]; then
            echo -e "\n${INFO_COLOR}Running welcome summary${NC}"
            bash "$WELCOME_SCRIPT"
        fi
    fi
fi
