#!/usr/bin/env bash

REPOS=$HOME/.homesick/repos
git clone https://github.com/goude/homeshick.git $REPOS/homeshick
source $REPOS/homeshick/homeshick.sh

homeshick clone https://github.com/robbyrussell/oh-my-zsh
homeshick clone https://github.com/goude/runcom.git
homeshick clone https://github.com/goude/vim-files.git
homeshick clone https://github.com/goude/yaprox.git

homeshick --force link
