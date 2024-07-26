#!/bin/fish

# Instalar OMF
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | bash
# Instalar fisher
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# Instalar plugins
fish -c "omf update"
fish -c "omf install mars"

fisher install jethrokuan/z
fisher install PatrickF1/fzf.fish
fisher install rstacruz/fish-asdf
fisher install gazorby/fish-abbreviation-tips
fisher install jorgebucaran/autopair.fish
fisher install nickeb96/puffer-fish
fisher install patrickf1/colored_man_pages.fish
fisher install ankitsumitg/docker-fish-completions

# Substituir arquivo de configuração do fish
rm ~/.config/fish/config.fish
sleep 1
ln ./config.fish ~/.config/fish/config.fish
