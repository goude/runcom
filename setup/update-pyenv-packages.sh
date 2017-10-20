#!/bin/bash

if [[ -d $HOME/.pyenv/bin ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

pyenv activate neovim3

$(pyenv which pip) install --upgrade jedi flake8 vim-vint yamllint requests pillow numpy click tmuxp jrnl autopep8

ln -s "$(pyenv which flake8)" ~/bin/flake8
ln -s "$(pyenv which tmuxp)" ~/bin/tmuxp
ln -s "$(pyenv which jrnl)" ~/bin/jrnl

pyenv rehash
pyenv deactivate
