#!/usr/bin/env bash
echo "Setting up programming environments..."

# Set environment vars with version numbers
source ../localenv

./setup-nvm.sh
./update-node-packages.sh

./setup-pyenv.sh
#./setup-pyenvs.sh
#./update-pyenv-packages.sh
(cd rcpy && ./setup.sh)
(cd rcpy/python3 && ./setup.sh)
(cd rcpy/python2 && ./setup.sh)

./setup-neovim.sh

./setup-rbenv.sh
./setup-ruby.sh
