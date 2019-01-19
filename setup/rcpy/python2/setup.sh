#!/usr/bin/env bash
PIPENV_CMD=~/.local/bin/pipenv

$PIPENV_CMD --python 2
ln -sf "$($PIPENV_CMD run pyenv which python2)" ~/bin/neovim-python2

$PIPENV_CMD install neovim

$PIPENV_CMD run pyenv rehash
