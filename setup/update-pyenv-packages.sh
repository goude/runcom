#!/bin/bash

if [[ -d $HOME/.pyenv/bin ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Python 3 libs and command line tools
pyenv activate neovim3

install_command="$(pyenv which pip) install --no-cache-dir --upgrade"

$install_command pip
$install_command \
  autopep8 \
  click \
  flake8 \
  humanfriendly \
  jedi \
  mypy \
  nbdime \
  neovim \
  numpy \
  pillow \
  pipenv \
  requests \
  tmuxp \
  topydo \
  visidata \
  vim-vint \
  yamllint \
  yapf

$install_command topydo[columns] topydo[ical]

pyenv rehash

ln -sf "$(pyenv which flake8)" ~/bin/flake8
ln -sf "$(pyenv which mypy)" ~/bin/mypy
ln -sf "$(pyenv which yapf)" ~/bin/yapf
ln -sf "$(pyenv which tmuxp)" ~/bin/tmuxp
ln -sf "$(pyenv which topydo)" ~/bin/topydo
ln -sf "$(pyenv which pipenv)" ~/bin/pipenv
ln -sf "$(pyenv which vd)" ~/bin/vd
ln -sf "$(pyenv which nbdiff)" ~/bin/nbdiff
ln -sf "$(pyenv which nbdime)" ~/bin/nbdime
ln -sf "$(pyenv which git-nbdiffdriver)" ~/bin/git-nbdiffdriver

pyenv deactivate
