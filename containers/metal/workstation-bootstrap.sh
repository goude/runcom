#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive
WORKDIR=~/tmp/bootstrap
mkdir -p $WORKDIR

echo "obtaining keys..."
mkdir -p ~/.ssh
curl https://github.com/goude.keys >> ~/.ssh/authorized_keys
sort ~/.ssh/authorized_keys | uniq > $WORKDIR/authorized_keys_uniq
mv -f $WORKDIR/authorized_keys_uniq ~/.ssh/authorized_keys
chmod og-rwx ~/.ssh/authorized_keys

echo "installing workstation..."
cd $WORKDIR
git clone https://github.com/goude/runcom

cd $WORKDIR/runcom/containers/metal/
sudo ./base-package-setup.sh

cd $WORKDIR/runcom/setup
./update-binary-tools.sh
./install.sh

cd $WORKDIR
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.2.0/FiraCode.zip
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
unzip $WORKDIR/FiraCode.zip

cd $WORKDIR
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
