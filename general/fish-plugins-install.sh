#!/bin/bash

source ./resources/functions.sh

info "Instalando Oh My Fish"
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

info "Instalando Fisher"
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

info "Instalando plugins OMF"
fish -c "omf update"
fish -c "omf install mars"

info "Instalando plugins do Fisher"
fish -c "fisher install jethrokuan/z"
fish -c "fisher install PatrickF1/fzf.fish"
fish -c "fisher install rstacruz/fish-asdf"
fish -c "fisher install gazorby/fish-abbreviation-tips"
fish -c "fisher install jorgebucaran/autopair.fish"
fish -c "fisher install nickeb96/puffer-fish"
fish -c "fisher install patrickf1/colored_man_pages.fish"
fish -c "fisher install ankitsumitg/docker-fish-completions"

info "Aplicando configurações do fish"
rm ~/.config/fish/config.fish
sleep 1
ln ./.config/fish/config.fish ~/.config/fish/config.fish
fish -c "source ~/.config/fish/config.fish"
