#!/bin/bash

# Function to display loading animation
function loading() {
	local MESSAGE="$1"
	local DELAY=0.5
	local NUM_POINTS=3

	echo -n "$MESSAGE"
	for ((i = 0; i < NUM_POINTS; i++)); do
		sleep $DELAY
		echo -n "."
	done
	echo ""
}

PACKAGES=(
	alacritty
	bpytop
	build-essential
	cargo
	curl
	discord
	fish
	fzf
	gnome-tweaks
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

# URLs
DEVEDITION_URL="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
FISHER_LINK="https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish"

# Step 1: Update package list
echo "Updating package list"
$APT_GET_UPDATE_COMMAND

# Step 2: Install desired packages
echo "Installing desired packages"
sudo apt install -y "${packages[@]}"

# Step 3: Set Fish as default shell
echo "Setting Fish as the default shell"
chsh -s /usr/bin/fish

# Step 4: Install Oh My Fish
echo "Installing Oh My Fish"
curl -sL https://get.oh-my.fish | fish

# Step 5: Install Fisher
echo "Installing Fisher"
fish -c "$(curl -Sl $FISHER_LINK | source && fisher install jorgebucaran/fisher)"

# Step 6: Install Firefox Developer Edition
echo "Installing Firefox Developer Edition"
wget "$DEVEDITION_URL" -O Firefox-dev.tar.bz2
sudo tar xjf Firefox-dev.tar.bz2 -C /opt/
rm -r Firefox-dev.tar.bz2
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox-dev

# Step 7: Configure desktop entry for Firefox Developer Edition
echo "Configuring desktop entry for Firefox Developer Edition"
echo "[Desktop Entry]
Name=Firefox-developer-edition
Exec=/usr/local/bin/firefox-dev
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Comment=browser
Type=Application
Terminal=false
Encoding=UTF-8
Categories=Utility;" | sudo tee -a /usr/share/applications/Firefox-dev.desktop >/dev/null

# Step 8: Replace fish configuration file
echo "Replacing fish configuration file"
rm ~/.config/fish/config.fish
ln ../Fish/config.fish ~/.config/fish/config.fish

# Step 9: Finalize installation
echo "Finalizing installation"
echo "Post-installation completed!"

# Wait for a moment
sleep 1

# Display loading animation for the next step
loading "Starting script for installation of fish plugins"
sleep 1

# Call the second script
../fish/fish_plugins_install.sh
