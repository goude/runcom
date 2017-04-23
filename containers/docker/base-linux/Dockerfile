FROM ubuntu:xenial
MAINTAINER Daniel Goude <daniel@goude.se>
EXPOSE 22

# Base packages
# --no-install-recommends \
RUN \
  apt-get update && \
  apt-get install -y \
    sudo git zsh tmux openssh-server \
    curl \
    gnupg build-essential cmake hdevtools \
    libxml2-dev libxslt-dev \
    libaio1 alien \
    exuberant-ctags silversearcher-ag \
    samba-client cifs-utils \
    software-properties-common \
    tree htop \
    locales \
    jq

RUN \
  add-apt-repository ppa:neovim-ppa/stable && \
  apt-get update && \
  apt-get install -y neovim

RUN \
  apt-get clean && \
  mkdir -p /var/run/sshd && \
  locale-gen en_US.UTF-8 && \
  useradd -ms /usr/bin/zsh runcom && \
  echo "runcom:runcom" | chpasswd && \
  adduser runcom sudo
  #/usr/bin/sshd

