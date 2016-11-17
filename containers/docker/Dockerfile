FROM ubuntu:xenial
MAINTAINER Daniel Goude <daniel@goude.se>

# Base packages
RUN apt-get update && apt-get install -y sudo git zsh tmux vim-nox openssh-server gnupg

# Base development packages
RUN apt-get install -y build-essential cmake hdevtools exuberant-ctags silversearcher-ag

# Development packages
RUN apt-get install -y nodejs python-dev python3-dev python3-pip python3-venv python3-matplotlib python3-pandas

RUN locale-gen en_US.UTF-8

RUN useradd -ms /usr/bin/zsh runcom && echo "runcom:runcom" | chpasswd && adduser runcom sudo

RUN mkdir -p /var/run/sshd

USER runcom
WORKDIR /home/runcom
RUN git clone https://github.com/goude/runcom.git
#RUN runcom/setup/bootstrap.sh
