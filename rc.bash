#!/usr/bin/env bash
source $HOME/.homesick/repos/runcom/rc.common

source $homeshick_repos/homeshick/completions/homeshick-completion.bash

GIT_PS1_SHOWDIRTYSTATE=1
#GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1

source $rcfiles/utils/git-completion.bash
source $rcfiles/utils/git-prompt.sh
source $rcfiles/utils/bash_colors

source $rcfiles/rc.common-post

# needs to come after aliases have been created, obviously
source $HOME/.homesick/repos/runcom/utils/fix_alias_completion.bash

# define prompt
bpr="\[$IRed\]\u\[$CReset\]"
bpr+="\[$White\]@\[$CReset\]"
bpr+="\[$Yellow\]\h\[$CReset\]"
bpr+=" \[$IBlack\]\W\[$CReset\]"
bpr+=" \[$IBlack\]λ\[$CReset\] "
export PS1=$bpr
unset bpr

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
