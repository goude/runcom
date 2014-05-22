#!/usr/bin/env bash

REPOS=$HOME/.homesick/repos
source $REPOS/homeshick/homeshick.sh

homeshick pull
vim +BundleInstall! +BundleClean +q
