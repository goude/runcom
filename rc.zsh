#!/usr/bin/env zsh
source $HOME/.homesick/repos/runcom/rc.common

# oh-my-zsh configuration
omz_dir=$HOME/.homesick/repos/oh-my-zsh
if [[ -e $omz_dir/oh-my-zsh.sh ]] then
    DISABLE_AUTO_UPDATE="true"
    DISABLE_AUTO_TITLE="true"
    COMPLETION_WAITING_DOTS="true"

    export ZSH=$omz_dir
    export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

    if [[ -z "$ZSH_THEME" ]] then
        export ZSH_THEME="drone"
    fi

    plugins+=(git tmux vi-mode history dircycle dirpersist)
    plugins+=(bower node npm rbenv)

    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

    if [[ $system == 'Linux' ]]; then
        plugins+=()
    fi

    if [[ $system == 'OSX' ]]; then
        plugins+=(terminalapp osx brew)
    fi

    # Must be last plugin
    plugins+=(zsh-syntax-highlighting)

    source $omz_dir/oh-my-zsh.sh
    unsetopt correct_all
fi
unset omz_dir

# Tweak this value if necessary
export KEYTIMEOUT=20

# Global zsh key bindings
bindkey -M viins 'jk' vi-cmd-mode
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char      # Control-h also deletes the previous char
bindkey "^U" kill-line
bindkey '^R' history-incremental-search-backward

# Vim's text-objects-ish for zsh
if [[ -f $HOME/.homesick/repos/opp.zsh/opp.zsh ]]; then
    source $HOME/.homesick/repos/opp.zsh/opp.zsh
    source $HOME/.homesick/repos/opp.zsh/opp/*.zsh
fi

# -o - allow long option names

# Allow octothorpe-prefixed comments
setopt -o interactivecomments

# Share history
setopt -o sharehistory

# Disable Ctrl-Z
set -o ignoreeof

source $HOME/.homesick/repos/runcom/rc.common-post
