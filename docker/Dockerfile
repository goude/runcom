FROM ubuntu:xenial
MAINTAINER Daniel Goude <daniel@goude.se>

RUN apt-get update && apt-get install -y sudo git zsh tmux vim-nox
RUN apt-get install -y build-essential cmake hdevtools exuberant-ctags silversearcher-ag
RUN apt-get install -y python-dev python3-dev python3-pip python3-venv python3-matplotlib python3-pandas nodejs

RUN useradd -ms /usr/bin/zsh runcom && echo "runcom:runcom" | chpasswd && adduser runcom sudo

USER runcom
WORKDIR /home/runcom
RUN git clone https://github.com/goude/runcom.git
RUN runcom/setup/bootstrap.sh


