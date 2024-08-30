#!/bin/bash

source ./resources/functions.sh

info "Aplicando configurações do sistema..."
dconf load / <./Ubuntu/mysettings.conf

info "Aplicando configurações do Alacritty..."
mkdir -p ~/.config/alacritty
cp -f ./alacritty/alacritty.yml ~/.config/alacritty/

info "Aplicando configurações do Flameshot..."
mkdir -p ~/.config/flameshot
cp -f ./.config/flameshot/flameshot.ini ~/.config/flameshot/

info "Aplicando configurações do Gnome Shell..."
mkdir -p ~/.local/share/gnome-shell/extensions
cp -r ./.local/share/gnome-shell/extensions/* ~/.local/share/gnome-shell/extensions/

info "Aplicando configurações do qBittorrent..."
mkdir -p ~/.config/qBittorrent
cp -f ./.config/qBittorrent/qBittorrent.conf ~/.config/qBittorrent/

info "Aplicando configurações do Conky..."
mkdir -p ~/.config/conky
cp -r ./.config/conky/* ~/.config/conky/

info "Aplicando configurações do Autostart..."
mkdir -p ~/.config/autostart
cp -r ./.config/autostart/* ~/.config/autostart/

info "Movendo comandos do TriggerCMD..."
mkdir -p ~/.triggers
cp -r ./.triggers/* ~/.triggers/

info "Movendo script de controle do monitor..."
sudo cp -f ./resources/monitor-controller /usr/bin/

echo "Configurações aplicadas com sucesso!"
