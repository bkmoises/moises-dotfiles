#!/bin/bash

source ../resources/functions.sh

info "Instalando o LazyVim"
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

info "Aplicando configurações pessoais ao LazyVim"
rm -rf ~/.config/nvim/lua/config ~/.config/nvim/lua/plugins
cp -rf ./.config/nvim/* ~/.config/nvim/lua/

info "Instalando dependências via apt"
sudo apt install -y php ruby julia ruby-full golang php-cli liblua5.1-0-dev xclip

info "Instalando dependências via npm"
sudo npm install -g tree-sitter-cli
sudo npm install -g neovim
sudo npm install -g yarn

info "Instalando dependências via pip"
pip3 install pynvim

info "Instalando dependências via gem"
sudo gem install neovim

info "Instalando dependências Lazygit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

info "Instalando composer"
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Instalar Yarn

#TODO: instalar o jsregexp
# sudo luarocks install jsregexp
#
# #TODO:
# pip install hererocks
# hererocks ~/.local/share/nvim/lazy-rocks --lua=5.1 -r latest
#
# sudo luarocks install jsregexp
#
# #TODO: instalador lazyvim
# mv ~/.config/nvim{,.bak}
#
# mv ~/.local/share/nvim{,.bak}
# mv ~/.local/state/nvim{,.bak}
# mv ~/.cache/nvim{,.bak}
#
# git clone https://github.com/LazyVim/starter ~/.config/nvim
#
# rm -rf ~/.config/nvim/.git
#
#
#
# cargo install viu
