#!/usr/bin/env bash

echo "Installing minimal environment..."

./setup-homeshick.sh

sudo APT_CONFIG=/home/admin/.apt.conf apt-get update
sudo APT_CONFIG=/home/admin/.apt.conf apt-get upgrade
sudo APT_CONFIG=/home/admin/.apt.conf apt-get install tmux zsh tree cifs-utils

./setup-pyenv.sh
./setup-pyenvs.sh

ln -s $HOME/.tmux.conf-template $HOME/.tmux.conf
