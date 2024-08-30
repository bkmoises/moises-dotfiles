#!/bin/bash

source ./resources/functions.sh

SYSTEM=$(awk -F= '/^ID_LIKE/ { gsub(/"/, "", $2); print $2 }' /etc/os-release)

if [ "$SYSTEM" == "ubuntu debian" ]; then
  ./Ubuntu/packages-install.sh
  ./Ubuntu/extras-install.sh
  ./Ubuntu/conf.sh
else
  ./Archlinux/posinstall.sh
fi

./general/fish-plugins-install.sh
./resources/conf.sh
./resources/fonts/fira-code.sh
./lazyvim/lazy-install.sh
