#!/bin/bash

source ./resources/functions.sh

SYSTEM=$(awk -F= '/^ID_LIKE/ { gsub(/"/, "", $2); print $2 }' /etc/os-release)

if [ "$SYSTEM" == "ubuntu debian" ]; then
  loading "Instalando pacotes"
  ./Ubuntu/packages-install.sh

  dconf load / < ./Ubuntu/mysettings.conf

  cp ./alacritty/alacritty.yml ~/.config/alacritty
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
