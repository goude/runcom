#!/usr/bin/env bash
source "$HOME/.homesick/repos/runcom/rc.pyenv"
source "$HOME/.homesick/repos/runcom/localenv"

$RUNCOM_PIPENV_CMD --python 3
ln -sf "$($RUNCOM_PIPENV_CMD run pyenv which python3)" ~/bin/neovim-python3

$RUNCOM_PIPENV_CMD install \
	autopep8 \
    docker-compose \
	flake8 \
	httpie \
	icdiff \
	jedi \
	maya \
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

$RUNCOM_PIPENV_CMD run pyenv rehash

pyenv_symlinks=(
	"flake8"
	"git-icdiff"
	"http"
	"icdiff"
	"mypy"
	"tmuxp"
	"topydo"
	"vd"
	"yapf"
    "docker-compose"
)

for i in "${pyenv_symlinks[@]}"
do
	echo "Symlinking $i to ~/bin/..."
	ln -sf "$($RUNCOM_PIPENV_CMD run pyenv which $i)" "$HOME/bin/$i"
done

