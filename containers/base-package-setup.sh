#!/bin/bash
echo Installing base packages...

# essentials
apt-get install -y \
  apt-transport-https \
  build-essential \
  ca-certificates \
  cmake \
  git \
  hdevtools \
  software-properties-common \
  tlsdate \
  tmux \
  zsh \
  exuberant-ctags \
  silversearcher-ag \
  curl \
  htop \
  jq \
  tree \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxml2-dev \
  libxslt-dev
