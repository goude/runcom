#!/bin/bash

# original script by ryin - https://gist.github.com/ryin/3106801

# nvim compilation on module-using system
# module load git ncurses # runtime deps
# module load CMake Autotools # compilation deps

# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $HOME/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

TMUX_VERSION=2.6

# create our directories
mkdir -p $HOME/local $HOME/tmux_tmp
cd $HOME/tmux_tmp

# download source files
wget -O tmux-${TMUX_VERSION}.tar.gz https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
#wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
wget -O zsh-5.4.2.tar.gz http://sourceforge.net/projects/zsh/files/zsh/5.4.2/zsh-5.4.2.tar.gz/download

# extract files, configure, and compile

############
# libevent #
############
tar xvzf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure --prefix=$HOME/local --disable-shared
make
make install
cd ..

############
# ncurses  #
############
#tar xvzf ncurses-5.9.tar.gz
#cd ncurses-5.9
#./configure --prefix=$HOME/local
#make
#make install
#cd ..

############
# zsh  #
############
tar xvzf zsh-5.4.2.tar.gz
cd zsh-5.4.2
#./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include" --prefix=$HOME/local
./configure --prefix=$HOME/local
make
make install
cd ..

############
# tmux     #
############
tar xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
#./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"
./configure CFLAGS="-I$HOME/local/include" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include"
#CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make
CPPFLAGS="-I$HOME/local/include" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/lib" make
cp tmux $HOME/local/bin
cd ..

# cleanup
rm -rf $HOME/tmux_tmp

echo "$HOME/local/bin/tmux is now available. You can optionally add $HOME/local/bin to your PATH."
