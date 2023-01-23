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
  snapd
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
sudo rm /var/lib/pacman/db.lck 2> /dev/null

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
  echo "go - Já instalado"
fi

mkdir "$DOWNLOAD_DIRECTORY" 2> /dev/null

git clone $URL_YAY $DOWNLOAD_DIRECTORY 2> /dev/null

cd $DOWNLOAD_DIRECTORY/
makepkg -si --noconfirm

for package in ${PACKAGES_INSTALL[@]}; do
  if ! yay -Qet | grep -q $package; then
    yay -S $package --noconfirm
  else
    echo "$package - Já instalado"
  fi
done

yay -Syyuu --noconfirm

systemctl start snapd

sudo snap install spotify

## docker
## kubernets
