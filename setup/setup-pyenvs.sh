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

# Python 3 - main environment
pyenv install $PYENV_PYTHON3_VERSION
pyenv virtualenv $PYENV_PYTHON3_VERSION neovim3
pyenv activate neovim3
$(pyenv which pip) install --upgrade pip
$(pyenv which pip) install neovim
pyenv deactivate

# Python 2.7
pyenv install $PYENV_PYTHON2_VERSION
pyenv virtualenv $PYENV_PYTHON2_VERSION neovim2
pyenv activate neovim2
$(pyenv which pip) install neovim
pyenv deactivate
