#!/bin/bash

# ## Python Virtual Environments
#
# Python 2.7 and 3.6 are installed as pyenvs. If you need to drop into a quick
# 'general use' python environment, say `pyenv activate neovim3`.

if [[ -d $HOME/.pyenv/bin ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Python 3 - main environment
pyenv install 3.6.1
pyenv virtualenv 3.6.1 neovim3
pyenv activate neovim3
$(pyenv which pip) install --upgrade pip
$(pyenv which pip) install neovim jedi flake8 vim-vint yamllint requests pillow numpy click tmuxp jrnl

ln -s "$(pyenv which flake8)" ~/bin/flake8
ln -s "$(pyenv which tmuxp)" ~/bin/tmuxp
ln -s "$(pyenv which jrnl)" ~/bin/jrnl

pyenv deactivate

# Python 2.7
pyenv install 2.7.13
pyenv virtualenv 2.7.13 neovim2
pyenv activate neovim2
$(pyenv which pip) install neovim
pyenv deactivate

nvim +PlugInstall +q +q
