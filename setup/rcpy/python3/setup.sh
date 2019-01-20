#!/usr/bin/env bash
source "$HOME/.homesick/repos/runcom/rc.pyenv"

PIPENV_CMD=~/.local/bin/pipenv

$PIPENV_CMD --python 3
ln -sf "$($PIPENV_CMD run pyenv which python3)" ~/bin/neovim-python3

$PIPENV_CMD install \
	autopep8 \
	flake8 \
	httpie \
	icdiff \
	jedi \
	mypy \
	neovim \
	pytest \
	requests \
	sphinx \
	tmuxp \
	topydo \
	vim-vint \
	visidata \
	yamllint \
	yapf

$PIPENV_CMD run pyenv rehash

pyenv_symlinks=(
	"git-icdiff"
	"icdiff"
	"flake8"
	"http"
	"mypy"
	"tmuxp"
	"topydo"
	"vd"
	"yapf"
)

for i in "${pyenv_symlinks[@]}"
do
	echo "Symlinking $i to ~/bin/..."
	ln -sf "$($PIPENV_CMD run pyenv which $i)" "$HOME/bin/$i"
done

