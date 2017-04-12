#!/bin/bash

if [[ -d $HOME/.pyenv/bin ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pyenv install 3.4.4
pyenv virtualenv 3.4.4 neovim3
pyenv activate neovim3
pip3.4 install --upgrade pip
pip3.4 install neovim jedi flake8 vim-vint yamllint
npm install -g htmlhint write-good jsonlint
ln -s `pyenv which flake8` ~/bin/flake8
pyenv deactivate

pyenv install 2.7.11
pyenv virtualenv 2.7.11 neovim2
pyenv activate neovim2
$(pyenv which pip) install neovim
pyenv deactivate

nvim +PlugInstall +q +q
