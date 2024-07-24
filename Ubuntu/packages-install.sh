#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y

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
	yarn
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
  fzf
  fd-find
  zoxide
  xclip
)

sudo apt install -y "${packages[@]}" 2> error.log

echo "Instalando Spotify"
sudo snap install spotify

echo "Instalando Yazi"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
cargo install --locked yazi-fm yazi-cli
cargo install --locked --git https://github.com/sxyazi/yazi.git yazi-fm yazi-cli

echo "Pacotes instalados com sucesso!"
