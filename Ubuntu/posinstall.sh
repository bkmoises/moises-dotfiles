#!/bin/bash

# Função para exibir animação de carregamento
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

packages=(
	alacritty
	bpytop
	build-essential
	cargo
	curl
	discord
	fish
	fzf
	make
	neovim
	nodejs
	npm
	python-pip
	python3
	qbittorrent
	ranger
	rust
	ssh
	tig
	tmux
	tree
	unrar
	unzip
	vlc
	wget
	yarn
)

# Atualizar lista de pacotes
sudo apt update -y

# Instalar pacotes desejados
sudo apt install -y "${packages[@]}"

# Configurar o Fish como shell padrão
chsh -s /usr/bin/fish

# Instalar Fisher
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# Instalar Firefox Developer Edition
wget "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US" -O Firefox-dev.tar.bz2
sudo tar xjf Firefox-dev.tar.bz2 -C /opt/
rm -r Firefox-dev.tar.bz2
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox-dev

# Configurar ícone e entrada de desktop para o Firefox Developer Edition
echo "[Desktop Entry]
Name=Firefox-developer-edition
Exec=/usr/local/bin/firefox-dev
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Comment=browser
Type=Application
Terminal=false
Encoding=UTF-8
Categories=Utility;" | sudo tee -a /usr/share/applications/Firefox-dev.desktop >/dev/null

# Substituir arquivo de configuração do fish
rm ~/.config/fish/config.fish
ln ../Fish/config.fish ~/.config/fish/config.fish

# Finalizar a instalação
echo "Pós-instalação concluída!"
sleep 1

loading "Iniciando script para instalação dos fish plugins"
sleep 1

# Chamar o segundo script
../fish/fish_plugins_install.sh
