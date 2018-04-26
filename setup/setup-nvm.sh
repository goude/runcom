#!/usr/bin/env bash
# change to clone repo instead, see instructions at
# https://github.com/creationix/nvm/blob/master/README.markdown#install-script
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

cd $HOME
git clone https://github.com/creationix/nvm.git .nvm
cd .nvm
#git checkout v0.33.1
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
source ./nvm.sh
#nvm install 7
nvm install 8
