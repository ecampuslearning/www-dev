#!/bin/bash

# Docker wrapper for devcontainer: build, run, or compose with sensible defaults and signal handling.
#
# Usage:
#   ./scripts/docker-deploy.sh <build|run|compose> [docker args]
#
# Examples:
#   ./scripts/docker-deploy.sh build --tag myimage:latest --file Dockerfile --context .
#   ./scripts/docker-deploy.sh build --no-cache --tag myimage:latest --file Dockerfile --context .
#   ./scripts/docker-deploy.sh run --rm -p 8080:8080 myimage:latest
#   ./scripts/docker-deploy.sh compose up -d
#
# Cache Control:
#   --no-cache     Disables all caching mechanisms (BuildKit and registry cache)
#                  This flag can be placed anywhere in the command line after 'build'

set -e

child_pid=""
# Trap SIGINT (Ctrl+C) to clean up child process and print a message
on_sigint() {
  if [[ -n "$child_pid" ]]; then
    kill -SIGINT "$child_pid" 2>/dev/null
  fi
  printf "\r"
  tput el 2>/dev/null
  echo -e "\033[1;33mProcess interrupted by user (SIGINT). Docker process stopped. Exiting cleanly.\033[0m"
  exit 0
}
trap on_sigint SIGINT

if [ $# -lt 1 ]; then
  echo "Usage: $0 <build|run|compose> [docker args]"
  exit 1
fi

SUBCOMMAND="$1"
shift

case "$SUBCOMMAND" in
  build)
    # Enable BuildKit and always use docker-container driver for Buildx
    export DOCKER_BUILDKIT=1
    export DOCKER_CLI_EXPERIMENTAL=enabled
    REGISTRY_USER="${REGISTRY_USER:-}"
    REGISTRY_REPO="${REGISTRY_REPO:-}"
    
    # Check if --no-cache parameter is provided anywhere in the arguments
    no_cache=false
    for arg in "$@"; do
      [[ "$arg" == "--no-cache" ]] && no_cache=true && break
    done
    
    # If --no-cache is provided, disable all caching mechanisms
    if $no_cache; then
      echo "Disabling all Docker caching (BuildKit enabled)"
      BUILDKIT_CACHE=""
      # We'll skip adding any cache-from or cache-to arguments later
    elif [ -z "$BUILDKIT_CACHE" ]; then
      BUILDKIT_CACHE="/tmp/.buildx-cache"
    fi
    if ! docker buildx inspect devcontainer-builder >/dev/null 2>&1; then
      docker buildx create --name devcontainer-builder --driver docker-container --use
    else
      docker buildx use devcontainer-builder
    fi
    docker buildx inspect --bootstrap devcontainer-builder
    # Add cache args if not present and if not using --no-cache
    extra_args=()
    
    # Only configure caching if --no-cache is not specified
    if ! $no_cache; then
      cache_from_present=false
      cache_to_present=false
      for arg in "$@"; do
        [[ "$arg" == --cache-from* ]] && cache_from_present=true
        [[ "$arg" == --cache-to* ]] && cache_to_present=true
      done
      
      if [ -n "$BUILDKIT_CACHE" ]; then
        if ! $cache_from_present; then
          extra_args+=(--cache-from=type=local,src="$BUILDKIT_CACHE")
        fi
        if ! $cache_to_present; then
          extra_args+=(--cache-to=type=local,dest="$BUILDKIT_CACHE",mode=max)
        fi
      elif ! $cache_from_present && [ -n "$REGISTRY_USER" ] && [ -n "$REGISTRY_REPO" ]; then
        extra_args+=(--cache-from=type=registry,ref=ghcr.io/$REGISTRY_USER/$REGISTRY_REPO:base)
      fi
      if ! $cache_to_present && [ -z "$BUILDKIT_CACHE" ]; then
        extra_args+=(--cache-to=type=inline)
      fi
    fi
    echo "Running: docker buildx build --builder devcontainer-builder --load ${extra_args[*]} $@"
    DOCKER_BUILDKIT=1 docker buildx build --builder devcontainer-builder --load "${extra_args[@]}" "$@"
    ;;
  run)
    echo "Running: docker run $@"
    docker run "$@" &
    child_pid=$!
    wait $child_pid
    ;;
  compose)
    echo "Running: docker compose $@"
    docker compose "$@" &
    child_pid=$!
    wait $child_pid
    ;;
  *)
    echo "Unknown subcommand: $SUBCOMMAND"
    echo "Usage: $0 <build|run|compose> [docker args]"
    exit 1
    ;;
esac
