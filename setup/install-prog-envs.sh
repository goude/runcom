#!/usr/bin/env bash
echo "Setting up programming environments..."

# Set environment vars with version numbers
source ../localenv

./setup-nvm.sh
./update-node-packages.sh

./install-rcpy.sh

./setup-neovim.sh
