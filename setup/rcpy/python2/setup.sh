#!/usr/bin/env bash
source "$HOME/.homesick/repos/runcom/localenv"

$RUNCOM_PIPENV_CMD --python 2
ln -sf "$($RUNCOM_PIPENV_CMD run pyenv which python2)" ~/bin/neovim-python2

$RUNCOM_PIPENV_CMD install neovim

$RUNCOM_PIPENV_CMD run pyenv rehash
