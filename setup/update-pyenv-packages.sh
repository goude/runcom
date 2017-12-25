#!/bin/bash

if [[ -d $HOME/.pyenv/bin ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Python 3 libs and command line tools
pyenv activate neovim3

$(pyenv which pip) install --upgrade jedi flake8 vim-vint yamllint requests pillow numpy click tmuxp jrnl autopep8 topydo
$(pyenv which pip) install topydo[columns]
$(pyenv which pip) install topydo[ical]

ln -sf "$(pyenv which flake8)" ~/bin/flake8
ln -sf "$(pyenv which tmuxp)" ~/bin/tmuxp
ln -sf "$(pyenv which jrnl)" ~/bin/jrnl
ln -sf "$(pyenv which topydo)" ~/bin/topydo

pyenv rehash
pyenv deactivate
