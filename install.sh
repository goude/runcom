#!/usr/bin/env bash

REPOS=$HOME/.homesick/repos
git clone https://github.com/goude/homeshick.git $REPOS/homeshick
source $REPOS/homeshick/homeshick.sh

echo "Cloning homeshick repos..."
homeshick clone https://github.com/robbyrussell/oh-my-zsh
homeshick clone https://github.com/goude/runcom.git
homeshick clone https://github.com/goude/yaprox.git
homeshick clone https://github.com/goude/vim-files.git

homeshick --force link

echo "Setting up Vim..."
source $REPOS/vim-files/install.sh

echo "Done."
