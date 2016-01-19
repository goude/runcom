#!/usr/bin/env bash
source $HOME/.homesick/repos/runcom/rc.common

source $homeshick_repos/homeshick/completions/homeshick-completion.bash

source $rcfiles/git/git-completion.bash
source $rcfiles/git/git-prompt.sh
source $rcfiles/bash/bash_colors
export PS1="\$(__git_ps1 '[%s]')\\n\[$Red\]\u\[$CReset\]@\[$Yellow\]\h\[$CReset\] \[$Blue\]\W\[$CReset\] \[$Green\]λ\[$CReset\] "

source $rcfiles/rc.common-post

# needs to come after aliases have been created, obviously
source $HOME/.homesick/repos/runcom/bash/fix_alias_completion.bash
