#!/bin/bash
set -u

# Fail fast with a concise message when not using bash
# Single brackets are needed here for POSIX compatibility
# shellcheck disable=SC2292
if [ -z "${BASH_VERSION:-}" ]; then
  abort "Bash is required to interpret this script."
fi

# utils for cool output
if [[ -t 1 ]]; then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi
tty_blue="$(tty_escape 34)"
tty_reset="$(tty_escape 0)"
log() {
  printf "%s\n" "$(shell_join "$@")"
}
shell_join() {
  local arg
  printf "%s" "${1:-}"
  shift
  for arg in "$@"; do
    printf " "
    printf "%s" "${arg// /\ }"
  done
}

log "${tty_blue}get flos core going!${tty_reset}"
if [[ -f ~/.lando/plugins/@lando/core/package.json ]]; then
  pushd ~/.lando/plugins/@lando/core >/dev/null || exit 1
  log "${tty_blue}just updating flos core...${tty_reset}"
  git fetch --all
  git pull
  log "${tty_blue}Install deps for flos core...${tty_reset}"
  docker run --rm -v .:/app --workdir=/app node:18.20-alpine3.19 npm clean-install --prefer-offline --frozen-lockfile
  chown -R "$(id -u)":"$(id -g)" node_modules
  popd >/dev/null || exit 1

  lando --clear
  log "${tty_blue}BOOMSHAKALAKA!! Flos core is setup!${tty_reset}"
else
  log "${tty_blue}You do not have flos core yet :/ Please use the setup script first!${tty_reset}"
fi
