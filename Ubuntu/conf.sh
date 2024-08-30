#!/bin/bash

source ./resources/functions.sh

info "Aplicando configurações do sistema..."
dconf load / <./Ubuntu/mysettings.conf

info "Aplicando configurações do Alacritty..."
mkdir ~/.config/alacritty
cp ./alacritty/alacritty.yml ~/.config/alacritty

info "Movendo comandos do TriggerCMD..."
cp -r ./.triggers/ ~/

info "Movendo script de controle do monitor..."
sudo mv ./resources/monitor-controller /usr/bin/
