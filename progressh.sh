#!/bin/bash

SPINNERS_FILE="spinners.json"
DEFAULT_SPINNER="dots"

usage() {
  echo "Usage: $0 [--spinner NAME] [--list] [--help]"
  echo
  echo "Options:"
  echo "  --spinner NAME   Use spinner NAME from $SPINNERS_FILE (default: $DEFAULT_SPINNER)"
  echo "  --list           List all available spinners"
  echo "  --help           Show this help message"
  exit 0
}

list_spinners() {
  jq -r 'keys[]' "$SPINNERS_FILE"
  exit 0
}

run_spinner() {
  local spinner="$1"
  frames=$(jq -r --arg s "$spinner" '.[$s].frames[]' "$SPINNERS_FILE")
  if [ -z "$frames" ]; then
    echo "Spinner '$spinner' not found in $SPINNERS_FILE"
    exit 1
  fi

  while true; do
    for f in $frames; do
      printf "\r$f"
      sleep 0.1
    done
  done
}

# --- parse args ---
spinner="$DEFAULT_SPINNER"

while [[ $# -gt 0 ]]; do
  case "$1" in
  --help) usage ;;
  --list) list_spinners ;;
  --spinner)
    spinner="$2"
    shift 2
    ;;
  *)
    echo "Unknown option: $1"
    usage
    ;;
  esac
done

run_spinner "$spinner"
