#!/usr/bin/env bash

REPOS=$HOME/.homesick/repos
git clone https://github.com/goude/homeshick.git "$REPOS/homeshick"
source "$REPOS/homeshick/homeshick.sh"

echo "Cloning homeshick repos..."

homeshick_repos=(
    "goude/runcom"
    "zsh-users/antigen"
    "goude/thxtime"
    "goude/yaprox"
    "spf13/spf13-vim"
    "chriskempson/base16-shell"
    "jimeh/tmuxifier"
    #"syl20bnr/spacemacs"
    #"goude/prezto"
)

for i in "${homeshick_repos[@]}"
do
    homeshick --force --batch clone "$i"
done

echo "Silently and forcefully linking homeshick..."
homeshick --force --batch --quiet link

echo "Done."
