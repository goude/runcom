#!/usr/bin/env bash

yum update
yum upgrade
yum groupinstall "Development Tools"
yum install \
  zsh \
  tmux \
  libbz2-dev \
  bzip2-devel \
  readline-devel \
  sqlite-devel \
  openssl-devel \
  libxml2-devel \
  cifs-utils \
  libxslt-devel
