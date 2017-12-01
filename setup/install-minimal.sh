#!/usr/bin/env bash

echo "Installing minimal environment..."

./setup-homeshick.sh

sudo -E apt-get update
sudo -E apt-get upgrade
sudo -E apt-get install tmux zsh tree cifs-utils

./setup-pyenv.sh
./setup-pyenvs.sh

ln -s $HOME/.tmux.conf-template $HOME/.tmux.conf
