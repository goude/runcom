#!/usr/bin/env bash
source $HOME/.homesick/repos/runcom/rc.common

source $homeshick_repos/homeshick/completions/homeshick-completion.bash

source $rcfiles/git/git-completion.bash
source $rcfiles/git/git-prompt.sh
source $rcfiles/bash/bash_colors

bprompt="\$(git_user_name_prompt) \$(__git_ps1 '[%s]')\\n"
bprompt+="\[$Red\]\u\[$CReset\]@\[$Yellow\]\h\[$CReset\] "
bprompt+="\[$Blue\]\W\[$CReset\] \[$Green\]λ\[$CReset\] "

export PS1=$bprompt
unset bprompt

source $rcfiles/rc.common-post

# needs to come after aliases have been created, obviously
source $HOME/.homesick/repos/runcom/bash/fix_alias_completion.bash
