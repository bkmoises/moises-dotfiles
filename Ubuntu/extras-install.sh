#!/bin/bash

source ./resources/functions.sh

extras=(
  python3-pip
  python3.10-venv
  openjdk-17-jdk
  conky
  playerctl
  chafa
  ffmpegthumbnailer
  zoxide
  libxcb1-dev
  libxcb-image0-dev
  libxcb-res0-dev
  libopencv-dev
)

info "Instalando extras..."
sudo apt install -y "${extras[@]}" 2>/tmp/error.log || error "Erro ao instalar extras. Verifique error.log para mais detalhes."

info "Instalando a versão mais recente do NVIM..."
wget -P /tmp https://github.com/neovim/neovim/releases/latest/download/nvim.appimage || error "Erro ao baixar NVIM"
chmod u+x /tmp/nvim.appimage
sudo mv /tmp/nvim.appimage /usr/local/bin/nvim

info "Instalando o NodeJs..."
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash - || error "Erro ao adicionar repositório do NodeJs"
sudo apt install -y nodejs || error "Erro ao instalar NodeJs"

info "Instalando o FZZ..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || error "Erro ao clonar FZZ"
~/.fzf/install

info "Instalando Yazi..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y || error "Erro ao instalar Rust"
~/.cargo/bin/rustup update || error "Erro ao atualizar Rust"
cargo install --locked yazi-fm yazi-cli || error "Erro ao instalar Yazi"
cargo install --locked --git https://github.com/sxyazi/yazi.git yazi-fm yazi-cli || error "Erro ao instalar Yazi via Git"

info "Extras instalados com sucesso!"