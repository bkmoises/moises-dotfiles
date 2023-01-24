#!/usr/bin/env bash
#----------------------------------------- VARIÁVEIS -----------------------------------------#
URL_YAY="https://aur.archlinux.org/yay.git"
URL_OMF="https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install"
URL_QBIT_THEME="https://github.com/dracula/qbittorrent/raw/master/dracula.qbtheme"
DOWNLOAD_DIRECTORY="$HOME/Downloads/files"

PACKAGES_INSTALL=(
  bpytop
  cargo
  curl
  discord
  dmenu
  firefox-developer-edition
  fish
  fisher
  fzf
  make
  neovim
  nodejs
  npm
  python3
  python-pip
  qbittorrent
  ranger
  rofi-greenclip
  rxvt
  snapd
  tig
  tmux
  tree
  unzip
  unrar
  vlc
  wget
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
wget -P $URL_QBIT_THEME $DOWNLOAD_DIRECTORY

cd $DOWNLOAD_DIRECTORY/
makepkg -si --noconfirm
mv *qbtheme* /opt

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

pip install spotify-cli-linux

curl $URL_OMF | fish

exec ./fish_plugins_install.sh

rm -rf $DOWNLOAD_DIRECTORY


## docker
## kubernets
