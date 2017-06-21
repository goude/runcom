#!/usr/bin/env bash

REPOS=$HOME/.homesick/repos
source "$REPOS/homeshick/homeshick.sh"

homeshick_repos=(
    "runcom"
    "adages"
    "thxtime"
    "yaprox"
    "jupyter-virtualenv"
)

for i in "${homeshick_repos[@]}"
do
    rm -rf "$REPOS/$i"
    homeshick --force --batch clone "git@github.com:goude/$i.git"
done

echo "Silently and forcefully linking homeshick..."
homeshick --force --batch --quiet link

echo "Done."
