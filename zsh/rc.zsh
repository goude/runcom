#!/bin/zsh
rcfiles=$(dirname $(dirname $_))

system=`$rcfiles/system`

export EDITOR=vim
export PYTHONSTARTUP=$HOME/.pystartup
export PATH=$PATH:$HOME/bin

if [ -f ~/.localenv ]; then
    . ~/.localenv
fi

if [[ -e ~/.oh-my-zsh/oh-my-zsh.sh ]] then
    DISABLE_AUTO_TITLE="true"
    COMPLETION_WAITING_DOTS="true"

    export ZSH=$HOME/.oh-my-zsh
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

    . ~/.oh-my-zsh/oh-my-zsh.sh
    unsetopt correct_all
fi

# Global zsh key bindings
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

if [[ $system == 'Linux' ]]; then
    . $rcfiles/zsh/rc.linux.zsh
fi
if [[ $system == 'OSX' ]]; then
    . $rcfiles/zsh/rc.osx.zsh
fi
if [[ $system == 'Cygwin' ]]; then
    . $rcfiles/zsh/rc.cygwin.zsh
fi

# load common aliases
. $rcfiles/aliases

# homeshick - git dotfile synchronizer
source $HOME/.homesick/repos/homeshick/homeshick.sh

# activate homeshick zsh completion
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

if [[ -f $HOME/.homesick/repos/yaprox/yaprox.sh ]]; then
    . $HOME/.homesick/repos/yaprox/yaprox.sh
fi

if [[ -f ~/.dir_colors && ( -x /usr/local/bin/dircolors || -x /usr/bin/dircolors ) ]]; then
    eval `dircolors ~/.dir_colors`
fi

if [[ -e ~/.ssh/ssh_auth_sock ]] then
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
fi

compile-zshrc () {
    rcfiles=$(dirname `readlink "$HOME/.zshrc"`)
    if [[ -z $rcfiles ]]; then
        echo "Cannot determine rcfiles location" >&2
        return
    fi
    if [[ -n $1 && $1 == "clean" ]]; then
        find $rcfiles -name '*.zwc' -delete
        echo 'All *.zwc files removed'
        return
    fi;
    for file in `find $rcfiles -name '*.zsh' -type f -print`; do
        zcompile $file
    done
}

homeshick --quiet refresh

unset rcfiles
unset system
