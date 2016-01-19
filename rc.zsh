#!/usr/bin/env zsh
source $HOME/.homesick/repos/runcom/rc.common

# homeshick completion needs to come before zsh compinit
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

prezto_dir=$HOME/.homesick/repos/prezto
if [[ -e $prezto_dir/init.zsh ]] then
    source $prezto_dir/init.zsh
fi
unset prezto_dir

# Tweak this value if necessary
export KEYTIMEOUT=20

# Global zsh key bindings
bindkey -M viins 'jk' vi-cmd-mode
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char      # Control-h also deletes the previous char
bindkey "^U" kill-line
bindkey '^R' history-incremental-search-backward

# Fix esc behavior a la http://superuser.com/questions/516474/escape-not-idempotent-in-zshs-vi-emulation
noop () { }
zle -N noop
bindkey -M vicmd '\e' noop

# Allow octothorpe-prefixed comments
setopt -o interactivecomments

# Share history
setopt -o sharehistory

# Disable Ctrl-Z
set -o ignoreeof

# Experimental candidates
setopt AUTO_CD
setopt AUTO_PUSHD
setopt AUTO_NAME_DIRS
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS
setopt RM_STAR_WAIT
setopt ZLE
setopt EXTENDED_GLOB

bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

bindkey -M vicmd "q" push-line
bindkey -M viins ' ' magic-space

# Finally, source common-post
source $HOME/.homesick/repos/runcom/rc.common-post
