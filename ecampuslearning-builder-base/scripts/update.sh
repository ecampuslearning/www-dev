#!/usr/bin/env bash
# =========================================================================
# System Update & Tool Downloads Script
# This script updates apt packages, pipx packages, and downloads latest
# versions of container tools with a unified progress bar
# =========================================================================
set -euo pipefail

# =========================================================================
# Terminal color and style definitions
# =========================================================================
BOLD="\033[1m"
RESET="\033[0m"
CYAN="\033[36m"
GREEN="\033[32m"
YELLOW="\033[33m"
MAGENTA="\033[35m"
BLUE="\033[34m"
RED="\033[31m"
BAR_COLOR="\033[1;32m"    # Bright green
TOOL_COLOR="\033[1;36m"   # Bright cyan
HEADER_COLOR="\033[1;35m" # Bright magenta
COMPLETE_COLOR="\033[1;32m" # Bright green

# =========================================================================
# Progress bar configuration
# =========================================================================
STEPS=("APT" "PipX" "Downloads" "Install")
TOTAL_STEPS=${#STEPS[@]}
STEP_DONE=(0 0 0 0)  # 0=APT, 1=PipX, 2=Downloads, 3=Install
BAR_WIDTH=40

# =========================================================================
# Display header
# =========================================================================
echo -e "${HEADER_COLOR}═════════════════════════════════════════════════${RESET}"
echo -e "${BOLD}${MAGENTA}  Starting System Update & Tool Downloads${RESET}"
echo -e "${HEADER_COLOR}═════════════════════════════════════════════════${RESET}"

# =========================================================================
# Set up temporary directories and initialize variables
# =========================================================================
TMPDIR="/tmp/devcontainer-update"
mkdir -p "$TMPDIR"
mkdir -p "$TMPDIR/debs"  # Subfolder for .deb files
DEB_DIR="$TMPDIR/debs"

# Create log file for pipx upgrades
PIPX_LOG="$TMPDIR/pipx-upgrade.log"
touch "$PIPX_LOG"

# Initialize tracking variables
apt_done=0
apt_update_shown=0
apt_info_printed=0
progress_bar_first_rendered=0
n_downloads=0
finalizing=0

# =========================================================================
# Start apt-get update in background
# =========================================================================
(sudo apt-get update > "$TMPDIR/apt-upgrade.log" 2>&1; \
 apt-get -s upgrade 2>/dev/null | awk '/^Inst /{print $2}' > "$TMPDIR/apt-will-upgrade.txt"; \
 touch "$TMPDIR/apt-update-done") &
APT_UPDATE_PID=$!
APT_PID=""

# Initialize APT tracking variables
APT_TOTAL=0
APT_DONE=0
if [ -f "$TMPDIR/apt-will-upgrade.txt" ]; then
  APT_TOTAL=$(wc -l < "$TMPDIR/apt-will-upgrade.txt" | awk '{print $1}')
fi

# =========================================================================
# Prepare download jobs for container tools
# =========================================================================
DOWNLOAD_JOBS=()

# Add tools to download if they're installed
if command -v hadolint &>/dev/null; then
  DOWNLOAD_JOBS+=("hadolint|https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64|$TMPDIR/hadolint")
fi

if command -v dockle &>/dev/null; then
  DOCKLE_VERSION_RAW=$(curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
  DOCKLE_VERSION="${DOCKLE_VERSION_RAW#v}"
  DOWNLOAD_JOBS+=("dockle|https://github.com/goodwithtech/dockle/releases/download/${DOCKLE_VERSION_RAW}/dockle_${DOCKLE_VERSION}_Linux-64bit.deb|$DEB_DIR/dockle.deb")
fi

if command -v dive &>/dev/null; then
  DIVE_VERSION_RAW=$(curl -s https://api.github.com/repos/wagoodman/dive/releases/latest | grep tag_name | cut -d '"' -f 4)
  DIVE_VERSION="${DIVE_VERSION_RAW#v}"
  DOWNLOAD_JOBS+=("dive|https://github.com/wagoodman/dive/releases/download/${DIVE_VERSION_RAW}/dive_${DIVE_VERSION}_linux_amd64.deb|$DEB_DIR/dive.deb")
fi

if command -v container-structure-test &>/dev/null; then
  DOWNLOAD_JOBS+=("container-structure-test|https://github.com/GoogleContainerTools/container-structure-test/releases/latest/download/container-structure-test-linux-amd64|$TMPDIR/container-structure-test")
fi

if command -v ctop &>/dev/null; then
  CTOP_VERSION_RAW=$(curl --silent "https://api.github.com/repos/bcicen/ctop/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
  CTOP_VERSION="${CTOP_VERSION_RAW#v}"
  DOWNLOAD_JOBS+=("ctop|https://github.com/bcicen/ctop/releases/download/${CTOP_VERSION_RAW}/ctop-${CTOP_VERSION}-linux-amd64|$TMPDIR/ctop")
fi

if command -v opa &>/dev/null; then
  DOWNLOAD_JOBS+=("opa|https://openpolicyagent.org/downloads/latest/opa_linux_amd64|$TMPDIR/opa")
fi

TOTAL_JOBS=${#DOWNLOAD_JOBS[@]}

# =========================================================================
# Start downloads in parallel
# =========================================================================
PIDS=()
DEB_PIDS=()
DOWNLOAD_STATUS=()

for i in "${!DOWNLOAD_JOBS[@]}"; do
  DOWNLOAD_STATUS+=(0)  # Initialize status array (0=not started, 1=success, 2=failed)
  IFS='|' read -r name url output <<< "${DOWNLOAD_JOBS[$i]}"
  
  # Start download in background
  (
    if curl --retry 3 --retry-delay 5 -sSL "$url" -o "$output"; then
      # Validate download is complete and not corrupted
      if [ -f "$output" ]; then
        actual_size=$(stat -c%s "$output")
        
        # Check expected size from Content-Length header for .deb files
        expected_size=$(curl -sI "$url" | awk '/Content-Length/ {print $2}' | tr -d '\r')
        if [ -n "$expected_size" ] && [ "$actual_size" -lt $((expected_size / 10)) ]; then
          rm -f "$output"
          exit 2  # Too small, likely corrupted
        elif [ "$actual_size" -lt 1048576 ]; then  # Less than 1MB
          rm -f "$output"
          exit 2  # Too small, likely corrupted
        fi
      fi
      exit 0  # Success
    else
      # On failure, delete any partial file
      [ -f "$output" ] && rm -f "$output"
      exit 2  # Failed
    fi
  ) &
  pid=$!
  PIDS+=("$pid")
  
  # Track .deb files separately for installation
  if [[ "$output" == *.deb ]]; then
    DEB_PIDS+=("$pid")
  fi
  
  # Map PID to download index
  eval "PID_IDX_$pid=$i"
done

# =========================================================================
# Display tools and packages to be updated
# =========================================================================

# Show tools to be downloaded
if [ "$TOTAL_JOBS" -gt 0 ]; then
  echo -e "${BOLD}${CYAN}  Tools to be downloaded:${RESET}"
  tool_names=()
  for job in "${DOWNLOAD_JOBS[@]}"; do
    IFS='|' read -r name url output <<< "$job"
    tool_names+=("$name")
  done
  printf "    ${TOOL_COLOR}%s${RESET}\n" "${tool_names[*]}"
  echo -e "${HEADER_COLOR}═════════════════════════════════════════════════${RESET}"
fi

# Initialize pipx variables and detect packages to upgrade
PIPX_TOTAL=0
PIPX_DONE=0
PIPX_PKGS=()
PIPX_STATUS=()

if command -v pipx &>/dev/null; then
  # Collect pipx packages that need upgrading
  while IFS= read -r pkg; do
    [ -n "$pkg" ] && PIPX_PKGS+=("$pkg")
  done < <(sudo pipx list --short 2>/dev/null | awk '{print $1}')
  PIPX_TOTAL=${#PIPX_PKGS[@]}
  
  # Show pipx packages to be upgraded
  if [ -n "${PIPX_PKGS[*]}" ]; then
    echo -e "${BOLD}${CYAN}  PipX packages to be upgraded:${RESET}"
    for pkg in "${PIPX_PKGS[@]}"; do
      echo -e "    ${TOOL_COLOR}$pkg${RESET}"
    done
  else
    echo -e "${BOLD}${CYAN}  No PipX packages to upgrade.${RESET}"
  fi
  echo -e "${HEADER_COLOR}═════════════════════════════════════════════════${RESET}"
fi

# =========================================================================
# Initialize progress tracking variables
# =========================================================================

# Spinner configuration
spinner_color="\033[1;35m"  # Bright purple (magenta)
spinner=("|" "/" "-" "\\")
spin_idx=0

# Track install progress for .deb files
DEB_TOTAL=0
for i in "${!DOWNLOAD_JOBS[@]}"; do
  IFS='|' read -r _ _ output <<< "${DOWNLOAD_JOBS[$i]}"
  if [[ "$output" == *.deb ]]; then
    DEB_TOTAL=$((DEB_TOTAL+1))
  fi
  # Pre-fill install status array
  INSTALL_STATUS+=(0)
done
DEB_INSTALLED=0

# =========================================================================
# Main progress bar loop
# =========================================================================
while :; do
  # Print apt info above the bar as soon as available
  if [ "$apt_update_shown" -eq 0 ] && [ -f "$TMPDIR/apt-update-done" ]; then
    apt_update_shown=1
    # Intentionally no output here - we just mark that we've seen the file
  fi
  if [ "$apt_update_shown" -eq 1 ] && [ "$apt_info_printed" -eq 0 ]; then
    if [ -s "$TMPDIR/apt-will-upgrade.txt" ]; then
      echo -e "${BOLD}${CYAN}  Apt packages to be upgraded:${RESET}"
      while read -r pkg; do
        echo -e "    ${TOOL_COLOR}$pkg${RESET}"
      done < "$TMPDIR/apt-will-upgrade.txt"
      echo -e "${HEADER_COLOR}───────────────────────────────────────────────${RESET}"
    else
      echo -e "${BOLD}${CYAN}  No apt packages to upgrade.${RESET}"
      echo -e "${HEADER_COLOR}───────────────────────────────────────────────${RESET}"
    fi
    # Start apt-get upgrade in background and set APT_PID
    (sudo apt-get upgrade -y >> "$TMPDIR/apt-upgrade.log" 2>&1) &
    APT_PID=$!
    apt_info_printed=1
  fi
  # Check apt upgrade
  if [ -n "$APT_PID" ] && [ "$apt_done" -eq 0 ] && ! kill -0 "$APT_PID" 2>/dev/null; then
    apt_done=1
    STEP_DONE[0]=1
  fi
  # Check downloads
  finished_downloads=0
  if [ "$TOTAL_JOBS" -gt 0 ] && [ "${STEP_DONE[2]}" -eq 0 ]; then
    # Remove finished or failed PIDs
    for idx in "${!PIDS[@]}"; do
      pid="${PIDS[$idx]}"
      if [ -z "$pid" ] || ! kill -0 "$pid" 2>/dev/null; then
        # Only update if not already marked
        eval "i=\${PID_IDX_$pid}"
        if [ "${DOWNLOAD_STATUS[$i]}" -eq 0 ]; then
          wait "$pid"
          status=$?
          if [ $status -eq 0 ]; then
            DOWNLOAD_STATUS[$i]=1
          else
            DOWNLOAD_STATUS[$i]=2
          fi
        fi
        unset 'PIDS[$idx]'
      fi
    done
    # Re-index PIDS to avoid gaps
    PIDS=("${PIDS[@]}")
    finished_downloads=$((TOTAL_JOBS - ${#PIDS[@]}))
    if [ "${#PIDS[@]}" -eq 0 ]; then
      STEP_DONE[2]=1
    fi
  else
    finished_downloads=$TOTAL_JOBS
  fi
  # Check if all .deb downloads are finished or failed to start install
  install_remaining=0
  for deb_pid in "${DEB_PIDS[@]}"; do
    # Find the download index for this deb_pid
    eval "deb_idx=\${PID_IDX_$deb_pid}"
    if [ "${DOWNLOAD_STATUS[$deb_idx]:-0}" -eq 0 ]; then
      install_remaining=1
      break
    fi
  done
  # If there are no .deb downloads, mark install as done immediately
  if [ "${#DEB_PIDS[@]}" -eq 0 ] && [ "${STEP_DONE[3]}" -eq 0 ]; then
    STEP_DONE[3]=1
  fi
  if [ "$install_remaining" -eq 0 ] && [ "${STEP_DONE[3]}" -eq 0 ] && [ "${#DEB_PIDS[@]}" -gt 0 ]; then
    # Install all .deb files in the debs folder, track progress
    for debfile in "$DEB_DIR"/*.deb; do
      [ -e "$debfile" ] || continue
      if sudo dpkg -i "$debfile" >/dev/null 2>&1; then
        DEB_INSTALLED=$((DEB_INSTALLED+1))
      else
        echo -e "${YELLOW}${BOLD}Warning: dpkg install failed for $debfile${RESET}"
        DEB_INSTALLED=$((DEB_INSTALLED+1))
      fi
    done
    STEP_DONE[3]=1
  fi
  # Start pipx upgrade as soon as APT is done, in parallel with downloads
  if [ "${STEP_DONE[0]}" -eq 1 ] && [ "${STEP_DONE[1]}" -eq 0 ]; then
    # Initialize pipx status array with zeros (0=not started, 1=success, 2=failed)
    if [ ${#PIPX_STATUS[@]} -eq 0 ] && [ $PIPX_TOTAL -gt 0 ]; then
      for ((i=0; i<$PIPX_TOTAL; i++)); do
        PIPX_STATUS+=(0)
      done
      
      # Start pipx upgrades in the background
      (
        # Use a counter to track packages
        pkg_idx=0
        for pkg in "${PIPX_PKGS[@]}"; do
          if [ -n "$pkg" ]; then
            echo "Upgrading pipx package: $pkg" >> "$PIPX_LOG"
            if sudo pipx upgrade "$pkg" >> "$PIPX_LOG" 2>&1; then
              # Mark as successful
              echo "$pkg_idx:1" > "$TMPDIR/pipx-status-$pkg_idx"
            else
              # Mark as failed
              echo "$pkg_idx:2" > "$TMPDIR/pipx-status-$pkg_idx"
              echo "Failed to upgrade pipx package: $pkg" >> "$PIPX_LOG"
            fi
          fi
          pkg_idx=$((pkg_idx+1))
        done
        # Signal that all pipx operations are complete
        touch "$TMPDIR/pipx-all-done"
      ) &
      PIPX_PID=$!
    fi
    
    # Check if all pipx upgrades are complete
    if [ -f "$TMPDIR/pipx-all-done" ]; then
      # Read status files and update the PIPX_STATUS array
      for ((i=0; i<$PIPX_TOTAL; i++)); do
        if [ -f "$TMPDIR/pipx-status-$i" ]; then
          status_val=$(cat "$TMPDIR/pipx-status-$i" | cut -d':' -f2)
          PIPX_STATUS[$i]=$status_val
        fi
      done
      STEP_DONE[1]=1
    fi
  fi
  # Draw unified progress bar
  # Calculate progress: each step is fractional if not done
  # Track APT progress (parse apt log for completed packages)
  if [ $APT_TOTAL -gt 0 ]; then
    APT_DONE=$(grep -E '^Preparing to unpack |^Unpacking |^Setting up ' "$TMPDIR/apt-upgrade.log" 2>/dev/null | awk '{print $3}' | sort -u | wc -l)
    [ "$APT_DONE" -gt "$APT_TOTAL" ] && APT_DONE=$APT_TOTAL
  fi

  # Track PipX progress (count upgraded packages)
  if [ $PIPX_TOTAL -gt 0 ]; then
    PIPX_DONE=0
    for i in "${!PIPX_STATUS[@]}"; do
      if [ "${PIPX_STATUS[$i]}" -eq 1 ] || [ "${PIPX_STATUS[$i]}" -eq 2 ]; then
        PIPX_DONE=$((PIPX_DONE+1))
      elif [ -f "$TMPDIR/pipx-status-$i" ]; then
        status_val=$(cat "$TMPDIR/pipx-status-$i" | cut -d':' -f2)
        PIPX_STATUS[$i]=$status_val
        if [ "$status_val" -eq 1 ] || [ "$status_val" -eq 2 ]; then
          PIPX_DONE=$((PIPX_DONE+1))
        fi
      fi
    done
    [ "$PIPX_DONE" -gt "$PIPX_TOTAL" ] && PIPX_DONE=$PIPX_TOTAL
  fi

  # Calculate progress: each step is fractional if not done
  apt_fraction=0
  if [ $APT_TOTAL -gt 0 ] && [ "${STEP_DONE[0]}" -eq 0 ]; then
    apt_fraction=$(awk "BEGIN {printf \"%.4f\", $APT_DONE/$APT_TOTAL}")
  elif [ "${STEP_DONE[0]}" -eq 1 ]; then
    apt_fraction=1
  fi

  download_fraction=0
  if [ "$TOTAL_JOBS" -gt 0 ] && [ "${STEP_DONE[2]}" -eq 0 ]; then
    download_fraction=$(awk "BEGIN {printf \"%.4f\", $finished_downloads/$TOTAL_JOBS}")
  elif [ "${STEP_DONE[2]}" -eq 1 ]; then
    download_fraction=1
  fi

  pipx_fraction=0
  if [ $PIPX_TOTAL -gt 0 ] && [ "${STEP_DONE[1]}" -eq 0 ]; then
    pipx_fraction=$(awk "BEGIN {printf \"%.4f\", $PIPX_DONE/$PIPX_TOTAL}")
  elif [ "${STEP_DONE[1]}" -eq 1 ]; then
    pipx_fraction=1
  fi

  install_fraction=0
  if [ $DEB_TOTAL -gt 0 ] && [ "${STEP_DONE[3]}" -eq 0 ]; then
    install_fraction=$(awk "BEGIN {printf \"%.4f\", $DEB_INSTALLED/$DEB_TOTAL}")
  elif [ "${STEP_DONE[3]}" -eq 1 ]; then
    install_fraction=1
  fi

  # Sum up fractional progress for the bar (no final_fraction)
  bar_fraction=$(awk "BEGIN {printf \"%.4f\", (${apt_fraction}+${download_fraction}+${pipx_fraction}+${install_fraction})/${TOTAL_STEPS}}")
  bar_fill=$(awk "BEGIN {printf \"%d\", ${bar_fraction}*${BAR_WIDTH}}")

  bar="${BAR_COLOR}│"
  for ((j=0;j<BAR_WIDTH;j++)); do
    # Calculate which download this bar segment belongs to
    if [ $j -lt $((BAR_WIDTH * finished_downloads / TOTAL_JOBS)) ] && [ "$TOTAL_JOBS" -gt 0 ]; then
      # Map bar segment to download index
      idx=$(( j * TOTAL_JOBS / BAR_WIDTH ))
      if [ "${DOWNLOAD_STATUS[$idx]:-0}" -eq 2 ]; then
        bar+="${RED}#${RESET}"
      else
        bar+="#"
      fi
    else
      bar+=" "
    fi
  done
  bar+="│${RESET} ${BOLD}Step:${RESET} "
  for i in "${!STEPS[@]}"; do
    step_label="${STEPS[$i]}"
    # Show progress for each step if it has a count
    # Map the step index to the correct variable
    case $i in
      0) # APT
        if [ $APT_TOTAL -gt 0 ]; then
          step_label+=" ($APT_DONE/$APT_TOTAL)"
        fi
        done_idx=0
        ;;
      1) # PipX
        if [ $PIPX_TOTAL -gt 0 ]; then
          step_label+=" ($PIPX_DONE/$PIPX_TOTAL)"
        fi
        done_idx=1
        ;;
      2) # Downloads
        if [ "$TOTAL_JOBS" -gt 0 ]; then
          step_label+=" ($finished_downloads/$TOTAL_JOBS)"
        fi
        done_idx=2
        ;;
      3) # Install (deb)
        if [ $DEB_TOTAL -gt 0 ]; then
          step_label+=" ($DEB_INSTALLED/$DEB_TOTAL)"
        fi
        done_idx=3
        ;;
    esac
    if [ "${STEP_DONE[$done_idx]}" -eq 1 ]; then
      bar+="${GREEN}${step_label}${RESET} "
    else
      bar+="${YELLOW}${step_label}${RESET} "
    fi
    if [ $i -lt $((TOTAL_STEPS-1)) ]; then bar+="→ "; fi
  done
  # Add spinner (always purple)
  spinner_char=${spinner[$((spin_idx % ${#spinner[@]}))]}
  line="${bar} ${spinner_color}${spinner_char}"
  # Dynamically pad to terminal width
  term_cols=$(tput cols 2>/dev/null || echo 80)
  # Remove color codes for length calculation
  line_plain=$(echo -e "$line" | sed 's/\x1B\[[0-9;]*[a-zA-Z]//g')
  pad_len=$(( term_cols - ${#line_plain} ))
  [ $pad_len -lt 0 ] && pad_len=0
  pad="$(printf '%*s' "$pad_len" " ")"
  printf "\r%b%s${RESET}\033[K" "$line" "$pad"
  progress_bar_first_rendered=1
  spin_idx=$((spin_idx+1))
  # Exit when all steps done
  if [ "${STEP_DONE[0]}" -eq 1 ] && [ "${STEP_DONE[1]}" -eq 1 ] && [ "${STEP_DONE[2]}" -eq 1 ] && [ "${STEP_DONE[3]}" -eq 1 ]; then
    break
  fi
  sleep 0.2
done
# Redraw the progress bar without the spinner, then move to a new line
# Clear the last spinner line before printing the final bar
printf "\r\033[K"
# Rebuild the bar for the final print (no spinner)
bar="${BAR_COLOR}│"
for ((j=0;j<BAR_WIDTH;j++)); do
  if [ $j -lt $((BAR_WIDTH * finished_downloads / TOTAL_JOBS)) ] && [ "$TOTAL_JOBS" -gt 0 ]; then
    idx=$(( j * TOTAL_JOBS / BAR_WIDTH ))
    if [ "${DOWNLOAD_STATUS[$idx]:-0}" -eq 2 ]; then
      bar+="${RED}#${RESET}"
    else
      bar+="#"
    fi
  else
    bar+=" "
  fi

done
bar+="│${RESET} ${BOLD}Step:${RESET} "
for i in "${!STEPS[@]}"; do
  step_label="${STEPS[$i]}"
  # Add numbers for each step if applicable
  case $i in
    0) # APT
      if [ $APT_TOTAL -gt 0 ]; then
        step_label+=" ($APT_DONE/$APT_TOTAL)"
      fi
      ;;
    1) # PipX
      if [ $PIPX_TOTAL -gt 0 ]; then
        step_label+=" ($PIPX_DONE/$PIPX_TOTAL)"
      fi
      ;;
    2) # Downloads
      if [ "$TOTAL_JOBS" -gt 0 ]; then
        step_label+=" ($finished_downloads/$TOTAL_JOBS)"
      fi
      ;;
    3) # Install (deb)
      if [ $DEB_TOTAL -gt 0 ]; then
        step_label+=" ($DEB_INSTALLED/$DEB_TOTAL)"
      fi
      ;;
  esac
  if [ "${STEP_DONE[$i]}" -eq 1 ]; then
    bar+="${GREEN}${step_label}${RESET} "
  else
    bar+="${YELLOW}${step_label}${RESET} "
  fi
  if [ $i -lt $((TOTAL_STEPS-1)) ]; then bar+="→ "; fi
done
line_no_spinner="${bar}    "
# Add a single newline after the progress bar for proper spacing
printf "\r%b\n" "$line_no_spinner"

# Wait for all downloads to finish (including non-.deb)
if [ "$TOTAL_JOBS" -gt 0 ]; then
  for pid in "${PIDS[@]}"; do
    if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
      wait "$pid"
    fi
  done
fi

# After all steps complete, show apt log if error and list actually upgraded packages
wait $APT_PID 2>/dev/null || true
APT_STATUS=$?
if [ $APT_STATUS -ne 0 ]; then
  echo -e "${YELLOW}${BOLD}Warning: apt-get update/upgrade failed. See log below:${RESET}"
  cat "$TMPDIR/apt-upgrade.log"
else
  # Show actually upgraded packages
  upgraded_pkgs=$(grep -E '^Preparing to unpack |^Unpacking |^Setting up ' "$TMPDIR/apt-upgrade.log" 2>/dev/null | awk '{print $3}' | sort -u)
  if [ -n "$upgraded_pkgs" ]; then
    echo -e "${BOLD}${CYAN}Packages upgraded:${RESET}"
    for pkg in $upgraded_pkgs; do
      echo -e "  ${TOOL_COLOR}$pkg${RESET}"
    done
    echo -e "${HEADER_COLOR}───────────────────────────────────────────────${RESET}"
  fi
  # Hide apt log output on success
  rm -f "$TMPDIR/apt-upgrade.log"
fi

# Show pipx packages that were successfully upgraded
if [ $PIPX_TOTAL -gt 0 ]; then
  echo -e "${BOLD}${CYAN}Pipx packages upgraded:${RESET}"
  pkg_idx=0
  for pkg in "${PIPX_PKGS[@]}"; do
    if [ "${PIPX_STATUS[$pkg_idx]}" -eq 1 ]; then
      echo -e "  ${TOOL_COLOR}$pkg${RESET}"
    fi
    pkg_idx=$((pkg_idx+1))
  done
  
  # Show any failed upgrades
  has_failed=0
  pkg_idx=0
  for pkg in "${PIPX_PKGS[@]}"; do
    if [ "${PIPX_STATUS[$pkg_idx]}" -eq 2 ]; then
      if [ $has_failed -eq 0 ]; then
        echo -e "${YELLOW}${BOLD}Warning: Failed to upgrade these PipX packages:${RESET}"
        has_failed=1
      fi
      echo -e "  ${YELLOW}$pkg${RESET}"
    fi
    pkg_idx=$((pkg_idx+1))
  done
  
  echo -e "${HEADER_COLOR}───────────────────────────────────────────────${RESET}"
fi

# =========================================================================
# Cleanup
# =========================================================================
# Clean up temporary files
rm -rf "$TMPDIR"
