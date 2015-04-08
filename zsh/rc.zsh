#!/bin/zsh
homeshick_repos=$HOME/.homesick/repos
rcfiles=$HOME/.homesick/repos/runcom
system=`$rcfiles/system`

# common environment variables
export PATH=$PATH:$HOME/.node/bin:$HOME/bin
export PYTHONSTARTUP=$HOME/.pystartup
export WORKON_HOME=$HOME/.virtualenvs
export EDITOR=vim

# homeshick - git dotfile synchronizer
source $HOME/.homesick/repos/homeshick/homeshick.sh
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

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

if [[ $system == 'Linux' ]]; then
    alias ls='ls -h --color=auto'
    alias rm='rm -I'
    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    #export TERM="xterm-256color"
    #export JAVA_HOME=/opt/java/jre1.7.0/
    #export PATH=/opt/node/bin:$PATH
fi
if [[ $system == 'OSX' ]]; then
    export CLICOLOR=1
    export LSCOLORS="gxfxcxdxbxegedabagacad"
    #export HOMEBREW_BUILD_FROM_SOURCE=1

    #bindkey "^[[3~" delete-char

    if [[ -x /usr/local/bin/gls ]]; then
        alias ls='/usr/local/bin/gls -h --color=auto'
    else
        alias ls='ls -hG'
    fi

    if [[ -z "$LANG" ]]; then
        export LANG='en_US.UTF-8'
    fi
fi
if [[ $system == 'Cygwin' ]]; then
    source $HOME/.homesick/repos/runcom/mintty/sol.dark
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

# Remove duplicates from environment vars
typeset -U PATH # remove duplicates

unset rcfiles
unset system
unset homeshick_repos
