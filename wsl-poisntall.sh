#!/bin/bash

packages=(
    base-devel
    cargo
    bpytop
    curl
    fish
    fisher
    fzf
    git
    neovim
    nodejs
    npm
    make
    python3
    python-pip
    ranger
    rust
    tig
    tmux
    tree
    unzip
    unrar
    wget
    yarn
)

sudo pacman -Syu

for package in ${packages[@]}; do
  if ! sudo pacman -Qet | grep -q $package; then
    sudo pacman -S $package --noconfirm
  else
    echo "$package - Já instalado"
  fi
done


echo "Instalação completa!"
