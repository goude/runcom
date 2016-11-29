#!/usr/bin/env bash

REPOS=$HOME/.homesick/repos
git clone https://github.com/goude/homeshick.git "$REPOS/homeshick"
source "$REPOS/homeshick/homeshick.sh"

echo "Cloning homeshick repos..."

homeshick_repos=(
    "git@github.com:goude/runcom.git"
    "git@github.com:goude/thxtime.git"
    "git@github.com:goude/yaprox.git"
    "zsh-users/antigen"
    "spf13/spf13-vim"
    "chriskempson/base16-shell"
    "jimeh/tmuxifier"
)

for i in "${homeshick_repos[@]}"
do
    homeshick --force --batch clone "$i"
done

echo "Silently and forcefully linking homeshick..."
homeshick --force --batch --quiet link

echo "Done."
