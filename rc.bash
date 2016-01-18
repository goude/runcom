#!/usr/bin/env bash
source $HOME/.homesick/repos/runcom/rc.common

source $HOME/.homesick/repos/runcom/git/git-completion.bash
source $HOME/.homesick/repos/runcom/git/git-prompt.sh
source $HOME/.homesick/repos/runcom/bash_colors
export PS1="\$(__git_ps1 '[%s]')\\n\[$Red\]\u\[$CReset\]@\[$Yellow\]\h\[$CReset\] \[$Blue\]\W\[$CReset\] \[$Green\]λ\[$CReset\] "

source $HOME/.homesick/repos/runcom/rc.common-post
