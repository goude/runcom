#!/usr/bin/env bash
echo "Installing/updating runcom..."

./setup-homeshick.sh

echo "Performing post-installation..."

ln -s $HOME/.tmux.conf-new $HOME/.tmux.conf
