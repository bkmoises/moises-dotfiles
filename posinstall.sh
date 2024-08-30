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

loading "Instalando Fish Plugins"
./fish/fish-plugins-install.sh
loading "Aplicando configurações"
./resources/conf.sh
loading "Instalando fonte FiraCode"
./resources/fonts/fira-code.sh
loading "Instalando LazyVim"
./lazyvim/lazy-install.sh
