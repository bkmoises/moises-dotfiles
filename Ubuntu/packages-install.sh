#!/bin/bash

#TODO: inscluir o python3

source ./resources/functions.sh

# Atualização e upgrade do sistema
info "Atualizando e fazendo upgrade do sistema..."
sudo apt update -y || error "Erro ao executar apt update"
sudo apt upgrade -y || error "Erro ao executar apt upgrade"
sudo apt dist-upgrade -y || error "Erro ao executar apt dist-upgrade"
sudo apt autoremove -y || error "Erro ao executar apt autoremove"

# Lista de pacotes a serem instalados
packages=(
  build-essential
  cargo
  npm
  python3
  python-pip
  curl
  make
  neovim
  ssh
  tig
  tmux
  tree
  unrar
  unzip
  wget
  bpytop
  diodon
  alacritty
  discord
  fish
  fzf
  flameshot
  qbittorrent
  vlc
  bat
  exa
  snapd
  unar
  jq
  ripgrep
  fd-find
  xclip
  gnome-tweaks
  gnome-shell-extensions
  cmake
)

# Instalação dos pacotes
info "Instalando pacotes..."
sudo apt install -y "${packages[@]}" 2>/tmp/error.log || error "Erro ao instalar pacotes. Verifique error.log para mais detalhes."

# Instalação do Spotify via snap
info "Instalando Spotify..."
sudo snap install spotify || error "Erro ao instalar Spotify"

# Instalação do Java 17
info "Instalando Java 17..."
sudo add-apt-repository ppa:linuxuprising/java -y || error "Erro ao adicionar repositório Java"
sudo apt-get update -y || error "Erro ao atualizar repositórios"
sudo apt-get install oracle-java17-installer oracle-java17-set-default -y || error "Erro ao instalar Java 17"

info "Pacotes instalados com sucesso!"
