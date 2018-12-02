#!/bin/bash

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#nvim +PlugInstall +q +q
#nvim +PlugInstall +q +q &> /dev/null < /dev/tty
echo before
nvim +PlugInstall +qall &> /dev/null < /dev/tty
echo after
