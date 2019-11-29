#!/usr/bin/env bash
set -e

source "$RUNCOM_PATH/rc.pyenv"
source "$RUNCOM_PATH/localenv"

$RUNCOM_PIPENV_CMD --python 3
ln -sf "$($RUNCOM_PIPENV_CMD run pyenv which python3)" ~/bin/neovim-python3
ln -sf "$($RUNCOM_PIPENV_CMD run pyenv which pip3)" ~/bin/neovim-pip3

$RUNCOM_PIPENV_CMD install --skip-lock \
	arrow \
	autopep8 \
	black \
	cheat \
	colored \
	cookiecutter \
	docker-compose \
	flake8 \
	howdoi \
	httpie \
	humanfriendly \
	icdiff \
	isort \
	jedi \
	mypy \
  pipx \
	pynvim \
	pytest \
  pydocstyle \
	reorder-python-imports \
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
	"black"
	"cheat"
	"cookiecutter"
	"docker-compose"
	"flake8"
	"git-icdiff"
	"howdoi"
	"http"
	"icdiff"
	"isort"
	"mypy"
  "pipx"
  "pydocstyle"
	"reorder-python-imports"
	"tmuxp"
	"topydo"
	"vd"
	"yapf"
)

for i in "${pyenv_symlinks[@]}"
do
	echo "Symlinking $i to ~/bin/..."
	ln -sf "$($RUNCOM_PIPENV_CMD run pyenv which $i)" "$HOME/bin/$i"
done

