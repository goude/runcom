function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function git_user {
    #[ -f ~/.gitconfig ] && grep '@' ~/.gitconfig | cut -d " " -f 3 -
    [ -f ~/.gitconfig ] && git config --get user.email
}

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} on %{$fg[yellow]%}$(box_name)%{$reset_color%} as %{$fg[blue]%}$(git_user)%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )%(1j.%j.)λ '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"
#RPROMPT='${return_status}%{$reset_color%}'

function drone_status {
    local drone_cmd=~/bin/drone
    [ -f $drone_cmd ] && $drone_cmd
}

RPROMPT+='$(drone_status)%{$reset_color%}'
#RPROMPT+='$(battery_level_gauge)'
