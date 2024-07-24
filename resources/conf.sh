#!/bin/bash

source ../resources/functions.sh

loading "Definindo shell padrão"
FISH_PATH=$(which fish)
sudo chsh -s $FISH_PATH $USER

# Instalar Fisher
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# Substituir arquivo de configuração do fish
rm ~/.config/fish/config.fish
ln ../resources/fish/config.fish ~/.config/fish/config.fish
