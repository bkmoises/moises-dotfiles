#!/bin/bash

source ./functions.sh

loading "Definindo shell padrão"
FISH_PATH=$(which fish)
sudo chsh -s $FISH_PATH $USER

# Instalar Fisher
bash -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
