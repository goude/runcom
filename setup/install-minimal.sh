#!/usr/bin/env bash

echo "Installing minimal environment..."

./setup-homeshick.sh

sudo -E apt-get update
sudo -E apt-get upgrade
sudo -E apt-get install tmux zsh tree cifs-utils
# Libs needed to build python packages
sudo -E apt-get install libbz2-dev libreadline-dev libsqlite3-dev libssl-dev libxml2-dev libxslt-dev

./setup-pyenv.sh
./setup-pyenvs.sh

ln -s $HOME/.tmux.conf-template $HOME/.tmux.conf
