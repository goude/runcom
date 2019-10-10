#!/usr/bin/env bash
source "$HOME/.homesick/repos/runcom/rc.pyenv"
source "$HOME/.homesick/repos/runcom/localenv"

$RUNCOM_PIPENV_CMD --python 3
ln -sf "$($RUNCOM_PIPENV_CMD run pyenv which python3)" ~/bin/neovim-python3

$RUNCOM_PIPENV_CMD install --skip-lock \
	arrow \
	autopep8 \
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
	neovim \
	pytest \
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
	"cheat"
	"cookiecutter"
	"docker-compose"
	"flake8"
	"git-icdiff"
	"howdoi"
	"http"
	"icdiff"
	"isort"
	"jedi"
	"mypy"
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

