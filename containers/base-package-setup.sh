#!/bin/bash

echo Installing base packages...

PACKAGES=$(cat master-list)
echo $PACKAGES
apt-get -y update && apt-get -y install $PACKAGES

# essentials
#apt-get install -y \
  #apt-transport-https \
  #build-essential \
  #ca-certificates \
  #cmake \
  #git \
  #software-properties-common \
  #tmux \
  #zsh \
  #exuberant-ctags \
  #silversearcher-ag \
  #curl \
  #htop \
  #jq \
  #tree \
  #libbz2-dev \
  #libcurl4-openssl-dev \
  #libreadline-dev \
  #libsqlite3-dev \
  #libssl-dev \
  #libxml2-dev \
  #libxslt-dev \
  #cifs-utils

