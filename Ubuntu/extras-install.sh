#!/bin/bash

source ./resources/functions.sh

sudo apt install python3-pip -y || error "Erro ao instalar Python3-pip"

# # Instalação do Yazi via cargo
info "Instalando Yazi..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y || error "Erro ao instalar Rust"
rustup update || error "Erro ao atualizar Rust"
cargo install --locked yazi-fm yazi-cli || error "Erro ao instalar Yazi"
cargo install --locked --git https://github.com/sxyazi/yazi.git yazi-fm yazi-cli || error "Erro ao instalar Yazi via Git"

info "Extras instalados com sucesso!"
