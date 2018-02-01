#!/bin/bash
source "$HOME/.nvm/nvm.sh"
nvm use node

npm install -g npm@latest htmlhint write-good jsonlint base16-builder-node eslint eslint-plugin-react tern tldr neovim

# TODO: check https://github.com/sindresorhus/awesome-nodejs

# build base16
#mkdir -p $HOME/.local/share/base16
#cd $HOME/.local/share/base16
#base16 builder