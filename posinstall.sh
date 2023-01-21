#!/usr/bin/env bash
#----------------------------------------- VARIÁVEIS -----------------------------------------#
URL_YAY="https://aur.archlinux.org/yay.git"

DOWNLOAD_DIRECTORY="$HOME/Downloads/files"

PACKAGES_INSTALL=(
  bpytop
  curl
  discord
  firefox-developer-edition
  fzf
  git
  go
  make
  neovim
  nodejs
  npm
  qbittorrent
  ranger
  spotify
  tig
  tmux
  tree
  unzip
  unrar
  vlc
  wget
  zsh
)


sudo pacman -S git go


mkdir "$DOWNLOAD_DIRECTORY"


## bmenu
## docker
## yay
## kubernets
