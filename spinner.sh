#!/bin/bash

SPINNERS_FILE="spinners.json"
DEFAULT_SPINNER="aesthetic"
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
  echo -e "${BOLD}Example usage:${RESET} $0 -s dots -c green -m 'Loading files...'"
  echo
  echo -e "${BOLD}Options:${RESET}"
  echo -e "  ${COLORS[cyan]}-s, --spinner NAME${RESET}      Use spinner from $SPINNERS_FILE (default: ${COLORS[green]}$DEFAULT_SPINNER${RESET}${COLORS[cyan]})"
  echo -e "  ${COLORS[cyan]}-i, --interval N${RESET}        Set speed 0=slow, 1=default, 2=fast (default: 1)"
  echo -e "  ${COLORS[cyan]}-l, --list${RESET}              List available spinners"
  echo -e "  ${COLORS[cyan]}-c, --color COLOR${RESET}       Spinner & message color (red, green, yellow, blue, magenta, cyan, white)"
  echo -e "  ${COLORS[cyan]}-d, --duration SECONDS${RESET}  Run spinner for fixed seconds and stop"
  echo -e "  ${COLORS[cyan]}-m, --message TEXT${RESET}      Show a message next to spinner"
  echo -e "  ${COLORS[cyan]}-h, --help${RESET}              Show this help message"
  echo
  echo -e "${BOLD}Usage with pipe:${RESET} ./myscript.py | $0 --spinner dots -m 'Processing...'"
  exit 0
}

list_spinners() {
  echo -e "${BOLD}Available spinners:${RESET}"
  for name in $(jq -r 'keys[]' "$SPINNERS_FILE"); do
    frames=$(jq -r --arg s "$name" '.[$s].frames[]' "$SPINNERS_FILE" | head -n 5 | tr '\n' ' ')
    echo -e "  ${COLORS[green]}$name${RESET}  $frames..."
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
  local message="$4"
  frames=($(jq -r --arg s "$spinner" '.[$s].frames[]' "$SPINNERS_FILE"))
  if [ -z "$frames" ]; then
    echo -e "${COLORS[red]}Spinner '$spinner' not found${RESET}"
    exit 1
  fi

  trap "tput cnorm; echo; exit" SIGINT
  tput civis

  local i=0
  while true; do
    printf "\r${color}${frames[i]} ${message}${RESET}"
    sleep "$interval"
    ((i = (i + 1) % ${#frames[@]}))
  done
}

# --- defaults ---
spinner="$DEFAULT_SPINNER"
interval="$DEFAULT_INTERVAL"
color="${COLORS[$DEFAULT_COLOR]}"
duration=""
message=""

# --- parse args ---
if [[ $# -eq 0 ]]; then
  # default: run spinner indefinitely
  run_spinner "$spinner" "$(convert_interval "$interval")" "$color" "$message"
  exit 0
fi

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
  -m | --message)
    message="$2"
    shift 2
    ;;
  *)
    echo -e "${COLORS[red]}Unknown option: $1${RESET}"
    usage
    ;;
  esac
done

interval=$(convert_interval "$interval")

# --- run spinner ---
run_spinner "$spinner" "$interval" "$color" "$message" &
spinner_pid=$!

# --- handle duration or pipe ---
if [ -n "$duration" ]; then
  sleep "$duration"
  kill $spinner_pid 2>/dev/null
elif [ ! -t 0 ]; then
  # Input is coming from a pipe
  cat >/dev/null
  kill $spinner_pid 2>/dev/null
else
  # No duration, no pipe → wait indefinitely (Ctrl+C will stop)
  wait $spinner_pid
fi

# Restore cursor and finish line
tput cnorm
