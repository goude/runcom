#!/bin/bash

# make sure nvm is available (for plugin installation)
source "$HOME/.nvm/nvm.sh"

echo 'setup-neovim: curl'
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo 'setup-neovim: curl done'

echo 'setup-neovim: pass 1'
nvim +PlugInstall +qall &> /dev/null < /dev/tty

echo 'setup-neovim: pass 2'
nvim +PlugInstall +q +q

#nvim +PlugInstall +q +q &> /dev/null < /dev/tty

echo 'setup-neovim: end of script'
