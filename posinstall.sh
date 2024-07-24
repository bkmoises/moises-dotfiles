#!/bin/bash

source ./resources/functions.sh

SYSTEM=$(awk -F= '/^ID_LIKE/ { gsub(/"/, "", $2); print $2 }' /etc/os-release)

if [ "$SYSTEM" == "ubuntu debian" ]; then
  loading "Instalando pacotes"
  ./Ubuntu/packages-install.sh

  cat ./Ubuntu/mysettings.conf | dconf load
else
  ./Archlinux/posinstall.sh
fi

loading "Instalando fish plugins"
./fish/fish_plugins_install.sh
loading "Aplicando configurações"
./resources/conf.sh
