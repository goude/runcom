#!/bin/zsh
rcfiles=$HOME/.homesick/repos/runcom

system=`$rcfiles/system`

export EDITOR=vim
export PYTHONSTARTUP=$HOME/.pystartup
export PATH=$PATH:$HOME/bin

if [ -f ~/.localenv ]; then
    . ~/.localenv
fi

# homeshick - git dotfile synchronizer
source $HOME/.homesick/repos/homeshick/homeshick.sh
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

omz_dir=$HOME/.homesick/repos/oh-my-zsh
if [[ -e $omz_dir/oh-my-zsh.sh ]] then
    DISABLE_AUTO_TITLE="true"
    COMPLETION_WAITING_DOTS="true"

    export ZSH=$omz_dir
    export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

    if [[ -z "$ZSH_THEME" ]] then
        #export ZSH_THEME="rgm"
        export ZSH_THEME="drone"
    fi

    plugins+=(git vi-mode history dircycle dirpersist)

    if [[ $system == 'Linux' ]]; then
        plugins+=()
    fi

    if [[ $system == 'OSX' ]]; then
        plugins+=(terminalapp osx brew bower node npm)
    fi

    source $omz_dir/oh-my-zsh.sh
    unsetopt correct_all
fi
unset omz_dir

# Global zsh key bindings
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

if [[ $system == 'Linux' ]]; then
    source $rcfiles/zsh/rc.linux.zsh
fi
if [[ $system == 'OSX' ]]; then
    source $rcfiles/zsh/rc.osx.zsh
fi
if [[ $system == 'Cygwin' ]]; then
    source $rcfiles/zsh/rc.cygwin.zsh
fi

# load common aliases
source $rcfiles/aliases

if [[ -f $HOME/.homesick/repos/yaprox/yaprox.sh ]]; then
    source $HOME/.homesick/repos/yaprox/yaprox.sh
fi

if [[ -f ~/.dir_colors && ( -x /usr/local/bin/dircolors || -x /usr/bin/dircolors ) ]]; then
    eval `dircolors ~/.dir_colors`
fi

if [[ -e ~/.ssh/ssh_auth_sock ]] then
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
fi

homeshick --quiet refresh

unset rcfiles
unset system
