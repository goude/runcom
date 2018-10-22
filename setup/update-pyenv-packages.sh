#!/bin/bash

if [[ -d $HOME/.pyenv/bin ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Python 3 libs and command line tools
pyenv activate neovim3

install_command="$(pyenv which pip) install --quiet --no-cache-dir --upgrade"

$install_command pip
$install_command \
  autopep8 \
  click==6.7 \
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

pyenv_symlinks=(
    "flake8"
    "mypy"
    "yapf"
    "tmuxp"
    "topydo"
    "pipenv"
    "vd"
    "nbdiff"
    "nbdime"
    "git-nbdiffdriver"
    "git-nbmergedriver"
    "git-nbdifftool"
    "git-nbmergetool"
)

for i in "${pyenv_symlinks[@]}"
do
    echo "Symlinking $i to ~/bin/..."
    ln -sf "$(pyenv which $i)" "$HOME/bin/$i"
done

pyenv deactivate
