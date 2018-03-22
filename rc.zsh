#!/usr/bin/env zsh

# begin profiling
# https://kev.inburke.com/kevin/profiling-zsh-startup-time/
PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%M%S%.} %N:%i> '
    exec 3>&2 2>$HOME/tmp/startlog.$$
    setopt xtrace prompt_subst
fi
# end profiling (see also section at end)

# dedupe paths
typeset -gU cdpath fpath mailpath path

#path=(
  #/usr/local/{bin,sbin}
  #$path
#)

if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#TMPPREFIX="${TMPDIR%/}/zsh"

# Highlighters {{{
# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES
typeset -A ZSH_HIGHLIGHT_HIGHLIGHTERS # not according to documentation

# https://github.com/zsh-users/zsh-syntax-highlighting/tree/master/highlighters/main
# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[comment]='fg=magenta,bold'
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
# }}}

source $HOME/.homesick/repos/runcom/rc.common

# homeshick completion needs to come before zsh compinit
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# Tweak this value if necessary
export KEYTIMEOUT=20

# Fix esc behavior a la http://superuser.com/questions/516474/escape-not-idempotent-in-zshs-vi-emulation
noop () { }
zle -N noop
bindkey -M vicmd '\e' noop

# Allow octothorpe-prefixed comments
setopt -o interactivecomments

# History options
alias history='history 0' # make history show everything
export HISTFILE=~/.zsh_history
export HISTSIZE=20000
export SAVEHIST=20000
setopt share_history

# Disable Ctrl-D
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

# Antigen
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins-Overview

source $HOME/.homesick/repos/antigen/antigen.zsh
antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle git
#antigen bundle goude/liquidprompt
antigen bundle Tarrasch/zsh-autoenv
antigen bundle gnu-utils

# antigen bundle history # h, hsi
antigen bundle history-substring-search

antigen bundle lukechilds/zsh-better-npm-completion

antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle docker
antigen bundle node
antigen bundle pip
antigen bundle python
antigen bundle vagrant

#antigen bundle extract # x swiss army knife
#antigen bundle felixr/docker-zsh-completion
#antigen bundle gitignore
#antigen bundle gpg-agent
#antigen bundle mvn
#antigen bundle npm
#antigen bundle rupa/z
#antigen bundle srijanshetty/zsh-pip-completion
#antigen bundle ssh-agent
#antigen bundle tmux
#antigen bundle vi-mode
#antigen bundle virtualenv
#antigen bundle web-search

# System-specific tweaks
if [[ $system == 'OSX' ]]; then
  antigen bundle brew
  antigen bundle brew-cask
  # antigen bundle osx
elif [[ $system == 'Linux' ]]; then
  # pass
elif [[ $system == 'Cygwin' ]]; then
  antigen bundle cygwin
fi

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_user dir dir_writable pyenv todo docker_machine nvm rbenv vcs)
POWERLEVEL9K_CUSTOM_USER="\$(echo git_user_name_prompt_mkii)"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen bundle zsh-users/zsh-completions

# https://github.com/zsh-users/zsh-autosuggestions/issues/296
if [[ $(zsh --version | awk '{print $2}') > 5.0.8 ]]; then
  antigen bundle zsh-users/zsh-autosuggestions
fi

# zsh-syntax-highlighting should be at end of .zshrc, according to instructions
antigen bundle zsh-users/zsh-syntax-highlighting

# Apply antigen configuration
antigen apply

# Global zsh key bindings
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char      # Control-h also deletes the previous char
bindkey "^U" kill-line

bindkey -M viins "^R" history-incremental-search-backward
bindkey -M viins "^P" history-substring-search-up
bindkey -M viins "^N" history-substring-search-down

bindkey -M viins "jk" vi-cmd-mode
bindkey -M viins " " magic-space
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward
bindkey -M vicmd "q" push-line

# Source more common setup
source $HOME/.homesick/repos/runcom/rc.common-post

# Setup right prompt
setopt prompt_subst
#export RPROMPT='$RUNCOM_TODO_CONTEXT'
export RPROMPT='$([ -f ~/.runcom-rprompt ] && cat ~/.runcom-rprompt) $RUNCOM_TODO_CONTEXT'
export DISABLE_AUTO_TITLE="true"

# Command-line Fuzzy Finder
# Note: if this line is moved above source rc.common-post, hocd completions
# (and possibly others) stop working in OSX.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FIXME: Ugly hack: rebind(?) to vi keys (did not need to, previously)
bindkey -v

# cleanup profiling
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi
# end cleanup profiling
