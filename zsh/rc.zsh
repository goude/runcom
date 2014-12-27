#!/bin/zsh
homeshick_repos=$HOME/.homesick/repos
rcfiles=$HOME/.homesick/repos/runcom

system=`$rcfiles/system`

# common environment variables
export PATH=$PATH:$HOME/bin
export PYTHONSTARTUP=$HOME/.pystartup
export WORKON_HOME=$HOME/.virtualenvs
export EDITOR=vim

# homeshick - git dotfile synchronizer
source $HOME/.homesick/repos/homeshick/homeshick.sh
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

omz_dir=$HOME/.homesick/repos/oh-my-zsh
if [[ -e $omz_dir/oh-my-zsh.sh ]] then
    DISABLE_AUTO_UPDATE="true"
    DISABLE_AUTO_TITLE="true"
    COMPLETION_WAITING_DOTS="true"

    export ZSH=$omz_dir
    export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

    if [[ -z "$ZSH_THEME" ]] then
        #export ZSH_THEME="rgm"
        export ZSH_THEME="drone"
    fi

    plugins+=(git vi-mode history dircycle dirpersist)
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

    if [[ $system == 'Linux' ]]; then
        plugins+=()
    fi

    if [[ $system == 'OSX' ]]; then
        plugins+=(terminalapp osx brew bower node npm rbenv)
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

#setopt MENUCOMPLETE

if [[ $system == 'Linux' ]]; then
    source $rcfiles/zsh/rc.linux.zsh
fi
if [[ $system == 'OSX' ]]; then
    source $rcfiles/zsh/rc.osx.zsh
fi
if [[ $system == 'Cygwin' ]]; then
    source $rcfiles/zsh/rc.cygwin.zsh
fi

source $rcfiles/aliases
source $rcfiles/functions

# Vim's text-objects-ish for zsh
if [[ -f $HOME/.homesick/repos/opp.zsh/opp.zsh ]]; then
    source $HOME/.homesick/repos/opp.zsh/opp.zsh
    source $HOME/.homesick/repos/opp.zsh/opp/*.zsh
fi

# Tmux improver
if [[ -d $HOME/.homesick/repos/tmuxifier/bin ]]; then
  export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
  PATH=$PATH:$HOME/.homesick/repos/tmuxifier/bin
  eval "$(tmuxifier init -)"
fi

if [[ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]]; then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

# Node/npm
#jNPM_PACKAGES="$HOME/.npm-packages"
#PATH="$NPM_PACKAGES/bin:$PATH"
#unset MANPATH  # delete if you already modified MANPATH elsewhere in your configuration
#MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
#export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# Proxy helper
if [[ -f $HOME/.homesick/repos/yaprox/yaprox.sh ]]; then
    source $HOME/.homesick/repos/yaprox/yaprox.sh
fi

if [[ -f ~/.dir_colors && ( -x /usr/local/bin/dircolors || -x /usr/bin/dircolors ) ]]; then
    eval `dircolors $HOME/.dir_colors`
fi

if [[ -e ~/.ssh/ssh_auth_sock ]] then
    export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock
fi

if [ -f ~/.localenv ]; then
    source ~/.localenv
fi

#homeshick --quiet refresh

# -o - allow long option names

# Allow octothorpe-prefixed comments
setopt -o interactivecomments

# Share history
setopt -o sharehistory

# Disable Ctrl-Z
set -o ignoreeof

# Turn off Ctrl-s XOFF
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

unset rcfiles
unset system
unset homeshick_repos
