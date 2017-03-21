#/bin/bash

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# not tested yet

pyenv install 3.4.4
pyenv virtualenv 3.4.4 neovim3
pyenv activate neovim3
pip3.4 install neovim
pip3.4 install flake8
ln -s `pyenv which flake8` ~/bin/flake8
pyenv deactivate

pyenv install 2.7.11
pyenv virtualenv 2.7.11 neovim2
pyenv activate neovim2
unalias pip
pip install neovim
pyenv deactivate
