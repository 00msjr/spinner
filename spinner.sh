#!/bin/bash

SPINNERS_FILE="spinners.json"
DEFAULT_SPINNER="dots"
DEFAULT_INTERVAL=0.1

# Colors
BOLD="\033[1m"
GREEN="\033[32m"
CYAN="\033[36m"
YELLOW="\033[33m"
RESET="\033[0m"

usage() {
  echo -e "${BOLD}Usage:${RESET} $0 [--spinner NAME|-s NAME] [--list|-l] [--interval SECONDS|-i SECONDS] [--help|-h]"
  echo
  echo -e "${BOLD}Options:${RESET}"
  echo -e "  ${CYAN}-s, --spinner NAME${RESET}   Use spinner NAME from $SPINNERS_FILE (default: $DEFAULT_SPINNER)"
  echo -e "  ${CYAN}-l, --list${RESET}           List all available spinners with previews"
  echo -e "  ${CYAN}-i, --interval SECONDS${RESET}  Set spinner speed (default: $DEFAULT_INTERVAL)"
  echo -e "  ${CYAN}-h, --help${RESET}           Show this help message"
  echo
  echo -e "${YELLOW}Press Ctrl+C to exit the spinner.${RESET}"
  exit 0
}

list_spinners() {
  echo -e "${BOLD}Available spinners:${RESET}"
  for name in $(jq -r 'keys[]' "$SPINNERS_FILE"); do
    frames=$(jq -r --arg s "$name" '.[$s].frames[]' "$SPINNERS_FILE" | head -n 5 | tr '\n' ' ')
    echo -e "  ${GREEN}$name${RESET}  $frames..."
  done
  exit 0
}

run_spinner() {
  local spinner="$1"
  local interval="$2"
  frames=$(jq -r --arg s "$spinner" '.[$s].frames[]' "$SPINNERS_FILE")
  if [ -z "$frames" ]; then
    echo "Spinner '$spinner' not found in $SPINNERS_FILE"
    exit 1
  fi

  # Hide cursor and restore on exit
  trap "tput cnorm; echo" EXIT
  tput civis

  while true; do
    for f in $frames; do
      printf "\r$f"
      sleep "$interval"
    done
  done
}

# --- parse args ---
spinner="$DEFAULT_SPINNER"
interval="$DEFAULT_INTERVAL"

while [[ $# -gt 0 ]]; do
  case "$1" in
  -h | --help) usage ;;
  -l | --list) list_spinners ;;
  -s | --spinner)
    spinner="$2"
    shift 2
    ;;
  -i | --interval)
    interval="$2"
    shift 2
    ;;
  *)
    echo "Unknown option: $1"
    usage
    ;;
  esac
done

run_spinner "$spinner" "$interval"
