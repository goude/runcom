#!/usr/bin/env bash
set -e

echo "Installing ~/bin/nvim..."
mkdir -p ~/bin

curl -L -o "$HOME/bin/nvim" --silent 'https://github.com/neovim/neovim/releases/download/stable/nvim.appimage'

chmod a+rx "$HOME/bin/nvim"
