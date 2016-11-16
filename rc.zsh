#!/usr/bin/env zsh

# FIXME: There are some things in .zprofile, check these.
export RPROMPT=" "

source $HOME/.homesick/repos/runcom/rc.common

# homeshick completion needs to come before zsh compinit
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

source $HOME/.homesick/repos/antigen/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/
antigen bundle git
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle nojhan/liquidprompt

# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins-Overview
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle docker
antigen bundle extract # x swiss army knife
antigen bundle gitignore
antigen bundle gnu-utils
antigen bundle gpg-agent
antigen bundle history # h, hsi
antigen bundle history-substring-search
antigen bundle mvn
antigen bundle node
antigen bundle pip
antigen bundle python
antigen bundle rupa/z
antigen bundle ssh-agent
#antigen bundle tmux
antigen bundle vagrant
antigen bundle vagrant
antigen bundle virtualenv
antigen bundle web-search # h, hsi

antigen bundle vi-mode
#antigen bundle npm

#antigen bundle felixr/docker-zsh-completion
#antigen bundle srijanshetty/zsh-pip-completion
antigen bundle lukechilds/zsh-better-npm-completion

if [[ $system == 'OSX' ]]; then
  antigen bundle brew
  antigen bundle brew-cask
  antigen bundle osx
elif [[ $system == 'Linux' ]]; then
  # pass
elif [[ $system == 'Cygwin' ]]; then
  antigen bundle cygwin
fi

antigen apply

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

# Allow redirect to overwrite existing files
setopt clobber

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
