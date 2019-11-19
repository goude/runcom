#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive
WORKDIR=~/tmp/bootstrap
mkdir -p $WORKDIR

echo "installing server..."
cd $WORKDIR
git clone https://github.com/goude/runcom

cd $WORKDIR/runcom/containers/metal/
sudo ./base-package-setup.sh

cd $WORKDIR/runcom/setup
./runcom-base-install.sh

echo "source ~/.runcom_bashrc" >> ~/.bashrc

#./update-binary-tools.sh
#./runcom-full-install.sh
