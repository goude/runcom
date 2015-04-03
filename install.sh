#!/usr/bin/env bash

REPOS=$HOME/.homesick/repos
git clone https://github.com/goude/homeshick.git $REPOS/homeshick
source $REPOS/homeshick/homeshick.sh

echo "Cloning homeshick repos..."
homeshick clone https://github.com/robbyrussell/oh-my-zsh
homeshick clone https://github.com/goude/runcom.git
homeshick clone https://github.com/goude/yaprox.git
homeshick clone https://github.com/spf13/spf13-vim.git
homeshick clone https://github.com/hchbaw/opp.zsh.git
homeshick clone https://github.com/jimeh/tmuxifier.git
git clone --depth=1 https://github.com/Bash-it/bash-it.git $REPOS/bash-it

homeshick --force link

echo "Setting up Vim..."
mkdir -p $REPOS/spf13-vim/.vim/bundle
git clone --recursive 'https://github.com/gmarik/vundle.git' $HOME/.vim/bundle/vundle
vim +BundleInstall! +BundleClean +q

echo "Done."
