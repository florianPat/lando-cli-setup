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

log "${tty_blue}get flos core up to date!${tty_reset}"
if [[ -f ~/.lando/plugins/@lando/core/package.json ]]; then
  lando update --yes

  pushd ~/.lando >/dev/null || exit 1
  log "${tty_blue}just updating flos core...${tty_reset}"
  curl -fsSL https://github.com/florianPat/lando-core/releases/latest/download/flos-lando-core.tgz -o ./flos-lando-core.tgz
  tar -xzf flos-lando-core.tgz
  rm flos-lando-core.tgz
  rm -rf plugins/@lando/core
  mv package plugins/@lando/core
  popd >/dev/null || exit 1

  lando --clear
  lando setup
  log "${tty_blue}BOOMSHAKALAKA!! Flos core is setup!${tty_reset}"
else
  log "${tty_blue}You do not have flos core yet :/ Please use the setup script first!${tty_reset}"
fi
