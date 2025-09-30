#!/bin/bash

SPINNERS_FILE="spinners.json"
DEFAULT_SPINNER="dots"
DEFAULT_INTERVAL=1 # user-friendly default (mapped to 0.1s)
DEFAULT_COLOR="white"

# Colors
declare -A COLORS=(
  [black]="\033[30m"
  [red]="\033[31m"
  [green]="\033[32m"
  [yellow]="\033[33m"
  [blue]="\033[34m"
  [magenta]="\033[35m"
  [cyan]="\033[36m"
  [white]="\033[37m"
)
BOLD="\033[1m"
RESET="\033[0m"

usage() {
  echo -e "${BOLD}Usage:${RESET} $0 [options]"
  echo
  echo -e "${BOLD}Options:${RESET}"
  echo -e "  -s, --spinner NAME      Use spinner from $SPINNERS_FILE (default: $DEFAULT_SPINNER)"
  echo -e "  -i, --interval N        Set speed 0=slow, 1=default, 2=fast (default: 1)"
  echo -e "  -l, --list              List available spinners"
  echo -e "  -c, --color COLOR       Spinner color (red, green, yellow, blue, magenta, cyan, white)"
  echo -e "  -d, --duration SECONDS  Run spinner for fixed seconds and stop"
  echo -e "  -h, --help              Show this help message"
  exit 0
}

list_spinners() {
  echo -e "${BOLD}Available spinners:${RESET}"
  for name in $(jq -r 'keys[]' "$SPINNERS_FILE"); do
    frames=$(jq -r --arg s "$name" '.[$s].frames[]' "$SPINNERS_FILE" | head -n 5 | tr '\n' ' ')
    echo -e "  $name  $frames..."
  done
  exit 0
}

convert_interval() {
  local user_input="$1"
  # Default if empty or invalid
  if ! [[ $user_input =~ ^[0-9]*\.?[0-9]*$ ]]; then user_input=1; fi
  (($(awk "BEGIN{print($user_input<0)}"))) && user_input=0
  (($(awk "BEGIN{print($user_input>2)}"))) && user_input=2
  awk -v val="$user_input" 'BEGIN { printf "%.3f", 0.15 - (val/2*0.1) }'
}

run_spinner() {
  local spinner="$1"
  local interval="$2"
  local color="$3"
  frames=($(jq -r --arg s "$spinner" '.[$s].frames[]' "$SPINNERS_FILE"))
  if [ -z "$frames" ]; then
    echo "Spinner '$spinner' not found"
    exit 1
  fi

  # Trap Ctrl+C to restore cursor
  trap "tput cnorm; echo; exit" SIGINT
  tput civis

  local i=0
  while true; do
    printf "\r${color}${frames[i]}  ${RESET}"
    sleep "$interval"
    ((i = (i + 1) % ${#frames[@]}))
  done
}

# --- defaults ---
spinner="$DEFAULT_SPINNER"
interval="$DEFAULT_INTERVAL"
color="${COLORS[$DEFAULT_COLOR]}"
duration=""

# --- parse args ---
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
  -c | --color)
    if [[ -n "${COLORS[$2]}" ]]; then color="${COLORS[$2]}"; else color="${COLORS[$DEFAULT_COLOR]}"; fi
    shift 2
    ;;
  -d | --duration)
    duration="$2"
    shift 2
    ;;
  *)
    echo "Unknown option: $1"
    usage
    ;;
  esac
done

interval=$(convert_interval "$interval")

# Run spinner in background
run_spinner "$spinner" "$interval" "$color" &
spinner_pid=$!

# Handle duration
if [ -n "$duration" ]; then
  sleep "$duration"
  kill $spinner_pid 2>/dev/null
  tput cnorm
else
  # Wait indefinitely, Ctrl+C will handle cleanup
  wait $spinner_pid
fi
