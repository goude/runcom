#!/usr/bin/env bash
echo "Setting up programming environments..."

# Set environment vars with version numbers
source ../localenv

./setup-nvm.sh
./update-node-packages.sh

#./setup-pyenv.sh
#./setup-pyenvs.sh
#./update-pyenv-packages.sh
./install-rcpy.sh

./setup-neovim.sh

#./setup-rbenv.sh
#./setup-ruby.sh
