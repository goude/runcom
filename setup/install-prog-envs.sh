#!/usr/bin/env bash
echo "Setting up programming environments..."

./setup-pyenv.sh
./setup-pyenvs.sh
./update-pyenv-packages.sh
./setup-neovim.sh

./setup-nvm.sh
./setup-node.sh

./setup-rbenv.sh