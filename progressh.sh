#!/bin/bash

SPINNERS_FILE="spinners.json"
DEFAULT_SPINNER="dots"

usage() {
  echo "Usage: $0 [--spinner NAME|-s NAME] [--list|-l] [--help|-h]"
  echo
  echo "Options:"
  echo "  -s, --spinner NAME   Use spinner NAME from $SPINNERS_FILE (default: $DEFAULT_SPINNER)"
  echo "  -l, --list           List all available spinners with previews"
  echo "  -h, --help           Show this help message"
  echo
  echo "Press Ctrl+C to exit the spinner."
  exit 0
}

list_spinners() {
  for name in $(jq -r 'keys[]' "$SPINNERS_FILE"); do
    frames=$(jq -r --arg s "$name" '.[$s].frames[]' "$SPINNERS_FILE" | head -n 5 | tr '\n' ' ')
    printf "%-15s %s...\n" "$name" "$frames"
  done
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
  -h | --help) usage ;;
  -l | --list) list_spinners ;;
  -s | --spinner)
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
