#!/usr/bin/env bash

REPOS=$HOME/.homesick/repos
source "$REPOS/homeshick/homeshick.sh"

echo "Removing homeshick repos..."

rm -rf $REPOS/runcom
rm -rf $REPOS/thxtime
rm -rf $REPOS/yaprox

echo "Cloning homeshick repos..."

homeshick_repos=(
    "git@github.com:goude/runcom.git"
    "git@github.com:goude/thxtime.git"
    "git@github.com:goude/yaprox.git"
)

for i in "${homeshick_repos[@]}"
do
    homeshick --force --batch clone "$i"
done

echo "Silently and forcefully linking homeshick..."
homeshick --force --batch --quiet link

echo "Done."
