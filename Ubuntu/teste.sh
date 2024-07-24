#!/bin/bash

function loading() {
	local mensagem="$1"
	local delay=0.5
	local num_pontos=3

	echo -n "$mensagem"
	for ((i = 0; i < num_pontos; i++)); do
		sleep $delay
		echo -n "."
	done
	echo ""
}

loading "Atualizando sistema"
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
)

sudo apt install -y "${packages[@]}"

loading "Definindo shell padrão"

FISH_PATH=$(which fish)

sudo chsh -s $FISH_PATH $USER
