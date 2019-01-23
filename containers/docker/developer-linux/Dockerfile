FROM ubuntu:bionic
MAINTAINER Daniel Goude <daniel@goude.se>
EXPOSE 22

RUN \
  export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get install -y \
    apt-transport-https \
    autoconf \
    automake \
    build-essential \
    ca-certificates \
    cifs-utils \
    cmake \
    curl \
    exuberant-ctags \
    g++ \
    gettext \
    git \
    gnupg \
    hdevtools \
    htop \
    jq \
    libbz2-dev \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libpng-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libtool \
    libtool-bin \
    libxml2-dev \
    libxslt-dev \
    locales \
    m4 \
    ninja-build \
    openssh-server \
    pandoc \
    pkg-config \
    postgresql-client \
    python3-pip \
    samba-client \
    screenfetch \
    silversearcher-ag \
    software-properties-common \
    sudo \
    tmux \
    tree \
    unzip \
    vim-nox \
    zlib1g-dev \
    zsh && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
  add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' && \
  add-apt-repository ppa:neovim-ppa/stable && \
  apt-get update && \
  apt-get install -y neovim r-base && \
  mkdir -p /var/run/sshd && \
  locale-gen en_US.UTF-8 && \
  useradd -ms /usr/bin/zsh runcom && \
  echo "runcom:runcom" | chpasswd && \
  adduser runcom sudo && \
  apt-get clean && \
  echo "developer-linux ubuntu:bionic $(date --iso-8601=seconds)" >> /home/runcom/.runcom-log && \
  chown runcom:runcom /home/runcom/.runcom-log
