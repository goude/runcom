#!/usr/bin/env bash
source $HOME/.homesick/repos/runcom/rc.common

source $homeshick_repos/homeshick/completions/homeshick-completion.bash

GIT_PS1_SHOWDIRTYSTATE=1
#GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1

source $rcfiles/git/git-completion.bash
source $rcfiles/git/git-prompt.sh
source $rcfiles/bash/bash_colors

source $rcfiles/rc.common-post

# needs to come after aliases have been created, obviously
source $HOME/.homesick/repos/runcom/bash/fix_alias_completion.bash

# define prompt

bpr="\$(get_extended_prompt_string)"
bpr+=" \$(__git_ps1 '[%s]')"
bpr+="\\n"

bpr+="\[$IRed\]\u\[$CReset\]"
bpr+="\[$White\]@\[$CReset\]"
bpr+="\[$Yellow\]\h\[$CReset\]"
bpr+=" \[$IBlack\]\W\[$CReset\]"
bpr+=" \[$IBlack\]λ\[$CReset\] "

export PS1=$bpr
unset bpr

