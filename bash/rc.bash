#!/bin/bash
#rcfiles=$(dirname ${BASH_ARGV[0]%/*})
rcfiles=$HOME/.homesick/repos/runcom

system=`$rcfiles/system`

if [ -f ~/.localenv ]; then
    . ~/.localenv
fi

. $rcfiles/bash/colors
. $rcfiles/functions

if [ "$system" == 'Linux' ]; then
    . $rcfiles/bash/rc.linux
fi
if [ "$system" == 'OSX' ]; then
    . $rcfiles/bash/rc.osx
fi
if [ "$system" == 'Cygwin' ]; then
    . $rcfiles/bash/rc.cygwin
fi

if [ ! -n "$HOSTNAME" ]; then
    HOSTNAME=`hostname -s`
fi

. $rcfiles/aliases
. $rcfiles/bash/completion
. $rcfiles/bash/prompt
. $rcfiles/bash/bindings

if [[ -f ~/.dir_colors && ( -x /usr/local/bin/dircolors || -x /usr/bin/dircolors ) ]]; then
    eval `dircolors ~/.dir_colors`
fi

export EDITOR='vim'

unset rcfiles
unset system
