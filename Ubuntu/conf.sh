#!/bin/bash

# Aplicar configurações do sistema
dconf load / <./Ubuntu/mysettings.conf

# Aplicar configuração do Alacritty
mkdir ~/.config/alacritty
cp ../alacritty/alacritty.yml ~/.config/alacritty

# Replicar comandos triggersCMD
cp -r ../.triggers/ ~/
