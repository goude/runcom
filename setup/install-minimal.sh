#!/usr/bin/env bash

echo "Installing minimal environment..."

sudo APT_CONFIG=/home/admin/.apt.conf apt-get update
sudo APT_CONFIG=/home/admin/.apt.conf apt-get install tmux zsh

./setup-homeshick.sh

./setup-pyenv.sh
./setup-pyenvs.sh

ln -s $HOME/.tmux.conf-template $HOME/.tmux.conf
