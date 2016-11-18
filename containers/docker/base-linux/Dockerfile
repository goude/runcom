FROM ubuntu:xenial
MAINTAINER Daniel Goude <daniel@goude.se>
EXPOSE 22

# Base packages
# --no-install-recommends \
RUN \
  apt-get update && \
  apt-get install -y \
    sudo git zsh tmux vim-nox openssh-server \
    gnupg build-essential cmake hdevtools \
    exuberant-ctags silversearcher-ag \
    nodejs nodejs-legacy npm \
    python-dev \
    python3-dev python3-pip python3-venv \
    python3-matplotlib python3-pandas

RUN \
  mkdir -p /var/run/sshd && \
  locale-gen en_US.UTF-8 && \
  useradd -ms /usr/bin/zsh runcom && \
  echo "runcom:runcom" | chpasswd && \
  adduser runcom sudo
  #/usr/bin/sshd

