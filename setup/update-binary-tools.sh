#!/usr/bin/env bash
set -e

echo "Installing tools in ~/bin..."
mkdir -p ~/bin

install_locally () {
	curl -L -o "$HOME/bin/$2" "$1"
	chmod a+rx "$HOME/bin/$2"
}

install_locally 'https://github.com/neovim/neovim/releases/download/stable/nvim.appimage' 'nvim'

# emojify download (tracked in home/bin)
#install_locally 'https://raw.githubusercontent.com/mrowa44/emojify/master/emojify' 'emojify'
