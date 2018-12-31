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
	colorama==0.3.9 \
	flake8 \
	humanfriendly \
	httpie \
	icdiff \
	jedi \
	mypy \
	numpy \
	pillow \
	pipenv \
	pynvim \
	requests \
	tmuxp \
	topydo \
	vim-vint \
	visidata \
	yamllint \
	yapf

#	nbdime
#"nbdime"
#"nbdiff"

$install_command topydo[columns] topydo[ical]

pyenv rehash

pyenv_symlinks=(
	"git-icdiff"
	"icdiff"
	"flake8"
	"git-nbdiffdriver"
	"git-nbdifftool"
	"git-nbmergedriver"
	"git-nbmergetool"
	"http"
	"mypy"
	"pipenv"
	"tmuxp"
	"topydo"
	"vd"
	"yapf"
)

for i in "${pyenv_symlinks[@]}"
do
	echo "Symlinking $i to ~/bin/..."
	ln -sf "$(pyenv which $i)" "$HOME/bin/$i"
done

pyenv deactivate
