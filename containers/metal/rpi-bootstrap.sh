#!/usr/bin/env bash
set -e

echo "Need to check how to raspi-conf this..."
#sudo locale-gen en_US.UTF-8

./install-keys.sh

export DEBIAN_FRONTEND=noninteractive
WORKDIR=~/tmp/bootstrap
mkdir -p $WORKDIR

echo "installing workstation..."
cd $WORKDIR
git clone https://github.com/goude/runcom

cd $WORKDIR/runcom/containers/metal/
sudo ./base-package-setup.sh

cd $WORKDIR/runcom/setup
./runcom-base-install.sh
