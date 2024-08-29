#!/bin/bash

BOLD="\e[1m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

error() {
  echo -e "${BOLD}${RED}ERRO: $1${RESET}" 1>&2
  exit 1
}

info() {
  echo -e "${BOLD}${GREEN}$1${RESET}"
}
