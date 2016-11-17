FROM ubuntu:xenial
MAINTAINER Daniel Goude <daniel@goude.se>

# Base packages
# --no-install-recommends \
# python-dev \
RUN \
  apt-get update && \
  apt-get install -y \
    sudo git zsh tmux vim-nox openssh-server \
    gnupg build-essential cmake hdevtools \
    exuberant-ctags silversearcher-ag \
    nodejs nodejs-legacy npm \
    python3-dev python3-pip python3-venv \
    python3-matplotlib python3-pandas

RUN \
  mkdir -p /var/run/sshd && \
  locale-gen en_US.UTF-8 && \
  useradd -ms /usr/bin/zsh runcom && \
  echo "runcom:runcom" | chpasswd && \
  adduser runcom sudo

USER runcom
WORKDIR /home/runcom

RUN \
  mkdir -p tmp/ && \
  git clone https://github.com/goude/runcom.git tmp/runcom && \
  tmp/runcom/setup/bootstrap.sh && \
  rm -rf tmp/runcom && \
  bin/build-youcompleteme
