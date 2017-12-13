#!/usr/bin/env bash
echo "Installing ~/bin/nvim..."
curl -L -o "$HOME/bin/nvim" --silent 'https://github.com/neovim/neovim/releases/download/v0.2.2/nvim.appimage'
chmod a+rx "$HOME/bin/nvim"
