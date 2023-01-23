#!/usr/bin/env bash
#----------------------------------------- VARIÁVEIS -----------------------------------------#
URL_YAY="https://aur.archlinux.org/yay.git"

DOWNLOAD_DIRECTORY="$HOME/Downloads/files"

PACKAGES_INSTALL=(
  bpytop
  curl
  clipit
  discord
  dmenu
  firefox-developer-edition
  fzf
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

## Remover travas do pacman
sudo rm /var/lib/pacman/db.lck

## Instalar o pacote git
if ! pacman -Qet | grep -q git; then
  sudo pacman -S git --noconfirm
else
  echo "Git - Instalado"
fi

## Instalar o pacote go
if ! pacman -Qet | grep -q git; then
  sudo pacman -S go --noconfirm
else
  echo "Go - Instalado"
fi

mkdir "$DOWNLOAD_DIRECTORY" 2> /dev/null

git clone $URL_YAY $DOWNLOAD_DIRECTORY 2> /dev/null

cd $DOWNLOAD_DIRECTORY/
makepkg -si --noconfirm



## bmenu
## docker
## yay
## kubernets
#
## go
