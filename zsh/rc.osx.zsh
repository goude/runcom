#!/bin/zsh

export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"
export HOMEBREW_BUILD_FROM_SOURCE=1

#bindkey "^[[3~" delete-char

if [[ -x /usr/local/bin/gls ]]; then
    alias ls='/usr/local/bin/gls -h --color=auto'
else
    alias ls='ls -hG'
fi

if [[ -z "$LANG" ]]; then
    export LANG='en_US.UTF-8'
fi

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
#echo "JAVA_HOME set to $JAVA_HOME"
