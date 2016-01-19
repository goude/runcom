#!/usr/bin/env bash
source $HOME/.homesick/repos/runcom/rc.common

source $homeshick_repos/homeshick/completions/homeshick-completion.bash

source $rcfiles/git/git-completion.bash
source $rcfiles/git/git-prompt.sh
source $rcfiles/bash/bash_colors

bprompt="\[$IBlack\]\$(git_user_name_prompt)\[$CReset\]"
bprompt+=" \[$IBlack\]\u\[$CReset\]"
bprompt+="\[$IBlack\]@\[$CReset\]"
bprompt+="\[$IBlack\]\h\[$CReset\]"
bprompt+=" \[$IBlack\]\$(__git_ps1 '[%s]')\[$CReset\]"
bprompt+="\\n"
bprompt+="\[$IPurple\]\W\[$CReset\] "
bprompt+="\[$IGreen\]λ\[$CReset\] "

export PS1=$bprompt
unset bprompt

source $rcfiles/rc.common-post

# needs to come after aliases have been created, obviously
source $HOME/.homesick/repos/runcom/bash/fix_alias_completion.bash
