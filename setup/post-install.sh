#!/usr/bin/env bash
echo "Performing post-installation..."

../home/bin/runcom-setup-git
ln -s $HOME/.tmux.conf-template $HOME/.tmux.conf
ln -s $HOME/.npmrc-template $HOME/.npmrc
