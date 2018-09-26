#!/usr/bin/env bash
echo "Installing ~/bin/nvim..."
mkdir -p ~/bin
#curl -L -o "$HOME/bin/nvim" --silent 'https://github.com/neovim/neovim/releases/download/v0.2.2/nvim.appimage'
#curl -L -o "$HOME/bin/nvim" --silent 'https://github.com/neovim/neovim/releases/download/v0.3.0/nvim.appimage'
curl -L -o "$HOME/bin/nvim" --silent 'https://github.com/neovim/neovim/releases/download/v0.3.1/nvim.appimage'

chmod a+rx "$HOME/bin/nvim"
