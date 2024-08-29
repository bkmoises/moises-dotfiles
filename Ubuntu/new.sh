#!/bin/bash

# Função para exibir mensagens de erro e parar o script
error_exit() {
  echo "$1" 1>&2
  exit 1
}

# Atualização e upgrade do sistema
echo "Atualizando e fazendo upgrade do sistema..."
sudo apt update -y || error_exit "Erro ao executar apt update"
sudo apt upgrade -y || error_exit "Erro ao executar apt upgrade"
sudo apt dist-upgrade -y || error_exit "Erro ao executar apt dist-upgrade"
sudo apt autoremove -y || error_exit "Erro ao executar apt autoremove"

# Lista de pacotes a serem instalados
packages=(
  build-essential
  cargo
  nodejs
  npm
  python3
  python3-pip
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
echo "Instalando pacotes..."
sudo apt install -y "${packages[@]}" 2>/tmp/error.log || error_exit "Erro ao instalar pacotes. Verifique error.log para mais detalhes."

# Instalação do Spotify via snap
echo "Instalando Spotify..."
sudo snap install spotify || error_exit "Erro ao instalar Spotify"

# Instalação do Yazi via cargo
echo "Instalando Yazi..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y || error_exit "Erro ao instalar Rust"
rustup update || error_exit "Erro ao atualizar Rust"
cargo install --locked yazi-fm yazi-cli || error_exit "Erro ao instalar Yazi"
cargo install --locked --git https://github.com/sxyazi/yazi.git yazi-fm yazi-cli || error_exit "Erro ao instalar Yazi via Git"

echo "Pacotes instalados com sucesso!"
