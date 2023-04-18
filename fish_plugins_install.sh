#!/bin/fish

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

omf update
omf install mars

fisher install jethrokuan/z
fisher install PatrickF1/fzf.fish
fisher install rstacruz/fish-asdf
fisher install gazorby/fish-abbreviation-tips
fisher install jorgebucaran/autopair.fish
fisher install nickeb96/puffer-fish
fisher install patrickf1/colored_man_pages.fish
fisher install ankitsumitg/docker-fish-completions

