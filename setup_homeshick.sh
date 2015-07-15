#!/usr/bin/env bash

REPOS=$HOME/.homesick/repos
git clone https://github.com/goude/homeshick.git $REPOS/homeshick
source $REPOS/homeshick/homeshick.sh

echo "Cloning homeshick repos..."

homeshick_repos=(
    #"robbyrussell/oh-my-zsh"
    "goude/prezto"
    "goude/runcom"
    "goude/yaprox"
    "spf13/spf13-vim"
    "hchbaw/opp.zsh"
    "jimeh/tmuxifier"
)

for i in "${homeshick_repos[@]}"
do
    homeshick --force --batch clone $i
    #if [ -d "$REPOS/$i" ]; then
        #echo "$i exists. Doing nothing."
    #else
        #echo "$i does not exist. Doing nothing."
    #fi
done

#git clone --depth=1 https://github.com/Bash-it/bash-it.git $REPOS/bash-it

echo "Silently and forcefully linking homeshick..."
homeshick --force --batch --quiet link

echo "Done."
