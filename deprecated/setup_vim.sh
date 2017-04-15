#!/usr/bin/env bash
echo "Setting up Vim..."

REPOS=$HOME/.homesick/repos
mkdir -p $REPOS/spf13-vim/.vim/bundle
git clone --recursive 'https://github.com/gmarik/vundle.git' $HOME/.vim/bundle/vundle
vim +BundleInstall! +BundleClean! +qall! +q! +q!
