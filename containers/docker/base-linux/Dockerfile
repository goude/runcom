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
    exuberant-ctags silversearcher-ag

RUN \
  mkdir -p /var/run/sshd && \
  locale-gen en_US.UTF-8 && \
  useradd -ms /usr/bin/zsh runcom && \
  echo "runcom:runcom" | chpasswd && \
  adduser runcom sudo
  #/usr/bin/sshd

