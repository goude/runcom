FROM ubuntu:xenial
MAINTAINER Daniel Goude <daniel@goude.se>
EXPOSE 22

RUN \
  apt-get update && \
  apt-get install -y \
    build-essential \
    cifs-utils \
    cmake \
    curl \
    exuberant-ctags \
    git \
    gnupg \
    hdevtools \
    htop \
    libaio1 alien \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxslt-dev \
    locales \
    openssh-server \
    samba-client \
    silversearcher-ag \
    software-properties-common \
    sudo \
    tmux \
    tree \
    zlib1g-dev \
    zsh \
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

RUN \
  apt-get install -y \
    golang \
    ghc \
    pandoc \
    python-dev \
    python3-dev python3-pip python3-venv \
    python3-lxml \
    python3-cairo \
    python3-matplotlib python3-pandas \
    python3-sklearn \
    openjdk-8-jre-headless \
    r-base && \
  apt-get clean
