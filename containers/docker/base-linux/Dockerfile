FROM ubuntu:xenial
MAINTAINER Daniel Goude <daniel@goude.se>
EXPOSE 22

# Base packages
# --no-install-recommends \
RUN \
  apt-get update && \
  apt-get install -y \
    sudo git zsh tmux vim-nox openssh-server \
    curl \
    gnupg build-essential cmake hdevtools \
    libxml2-dev libxslt-dev \
    libaio1 alien \
    exuberant-ctags silversearcher-ag \
    samba-client cifs-utils \
    tree htop \
    task

RUN \
  mkdir -p /var/run/sshd && \
  locale-gen en_US.UTF-8 && \
  useradd -ms /usr/bin/zsh runcom && \
  echo "runcom:runcom" | chpasswd && \
  adduser runcom sudo
  #/usr/bin/sshd

