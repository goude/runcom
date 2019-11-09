#!/usr/bin/env bash
set -e

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
./update-binary-tools.sh
./runcom-full-install.sh

cd $WORKDIR
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.2.0/FiraCode.zip
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
unzip $WORKDIR/FiraCode.zip

cd $WORKDIR
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
