#!/usr/bin/env bash

REPOS=$HOME/.homesick/repos
git clone https://github.com/goude/homeshick.git "$REPOS/homeshick"
source "$REPOS/homeshick/homeshick.sh"

echo "Cloning homeshick repos..."

homeshick_repos=(
    "goude/prezto"
    "goude/runcom"
    "goude/thxtime"
    "goude/yaprox"
    "syl20bnr/spacemacs"
    "spf13/spf13-vim"
    "jamesob/desk" # A lightweight workspace manager for the shell
    #"magicmonty/bash-git-prompt"
    #"jimeh/tmuxifier"
)

for i in "${homeshick_repos[@]}"
do
    homeshick --force --batch clone "$i"
done

echo "Silently and forcefully linking homeshick..."
homeshick --force --batch --quiet link

echo "Done."
