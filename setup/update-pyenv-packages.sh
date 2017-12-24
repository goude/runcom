#!/bin/bash

if [[ -d $HOME/.pyenv/bin ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Python 3 libs and command line tools
pyenv activate neovim3

$(pyenv which pip) install --upgrade jedi flake8 vim-vint yamllint requests pillow numpy click tmuxp jrnl autopep8

ln -sf "$(pyenv which flake8)" ~/bin/flake8
ln -sf "$(pyenv which tmuxp)" ~/bin/tmuxp
ln -sf "$(pyenv which jrnl)" ~/bin/jrnl

pyenv rehash
pyenv deactivate


# Python 2 libs and command line tools
pyenv activate neovim2

$(pyenv which pip) install --upgrade todopy
ln -sf "$(pyenv which todopy)" ~/bin/todopy

pyenv deactivate
