#!/bin/bash

source ./resources/functions.sh

info "Instalando fonte Fira Code"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip -O FiraCode.zip
unzip FiraCode.zip -d FiraCode
mkdir -p ~/.local/share/fonts
mv FiraCode/*.ttf ~/.local/share/fonts/
fc-cache -fv
