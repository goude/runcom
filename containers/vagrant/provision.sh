echo Running provisioning script...

add-apt-repository ppa:neovim-ppa/stable
apt-get update

# essentials
apt-get install -y \
  apt-transport-https \
  build-essential \
  ca-certificates \
  cmake \
  git \
  hdevtools \
  linux-image-extra-$(uname -r) \
  linux-image-extra-virtual \
  software-properties-common \
  tlsdate \
  tmux \
  vim-nox \
  zsh \
  exuberant-ctags \
  silversearcher-ag \
  curl \
  htop \
  jq \
  neovim \
  tree \
  libbz2-dev \
  libreadline-dev \
  libcurl4-openssl-dev \
  libsqlite3-dev \
  libssl-dev \
  libxml2-dev \
  libxslt-dev \
  ghc \
  pandoc \
  cifs-utils \
  openjdk-8-jre-headless \
  postgresql-client

#python-dev \
#python3-cairo \
#python3-dev \
#python3-lxml \
#python3-matplotlib \
#python3-pandas \
#python3-pip \
#python3-venv \

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install -y docker-ce
apt-get clean

gpasswd -a vagrant docker

# Get setup files for next stage.
git clone https://github.com/goude/runcom /tmp/runcom

echo Done.
