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
bpr="\[$IBlack\]\u\[$CReset\]"
bpr+="\[$IBlack\]@\[$CReset\]"
bpr+="\[$IBlack\]\h\[$CReset\]"

bpr+=" \[$IBlack\]\$(git_user_name_prompt)\[$CReset\]"
bpr+=" \[$IBlack\]$BOXNAME\[$CReset\]"
bpr+=" \[$IBlack\]\$(get_extended_prompt_string)\[$CReset\]"
bpr+=" \[$IBlack\]\$(__git_ps1 '[%s]')\[$CReset\]"
bpr+="\\n"

bpr+="\[$IPurple\]\W\[$CReset\] "
bpr+="\[$IGreen\]λ\[$CReset\] "

export PS1=$bpr
unset bpr

