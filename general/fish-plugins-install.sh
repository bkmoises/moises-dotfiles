#!/bin/fish

source ./resources/functions.sh

info "Instalando Oh My Fish"
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

info "Instalando Fisher"
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

info "Instalando plugins OMF"
fish -c "omf update"
fish -c "omf install mars"

info "Instalando plugins do Fisher"
fisher install jethrokuan/z
fisher install PatrickF1/fzf.fish
fisher install rstacruz/fish-asdf
fisher install gazorby/fish-abbreviation-tips
fisher install jorgebucaran/autopair.fish
fisher install nickeb96/puffer-fish
fisher install patrickf1/colored_man_pages.fish
fisher install ankitsumitg/docker-fish-completions

info "Aplicando configurações do fish"
rm ~/.config/fish/config.fish
sleep 1
ln -sf ./.config/fish/config.fish ~/.config/fish/config.fish
