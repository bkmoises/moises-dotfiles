#!/bin/bash

#TODO: inscluir o python3

source ../resources/functions.sh

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
  nodejs
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
  ffmpegthumbnailer
  unar
  jq
  ripgrep
  fd-find
  zoxide
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

# # Instalação do Yazi via cargo
# info "Instalando Yazi..."
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y || error "Erro ao instalar Rust"
# rustup update || error "Erro ao atualizar Rust"
# cargo install --locked yazi-fm yazi-cli || error "Erro ao instalar Yazi"
# cargo install --locked --git https://github.com/sxyazi/yazi.git yazi-fm yazi-cli || error "Erro ao instalar Yazi via Git"

info "Pacotes instalados com sucesso!"
