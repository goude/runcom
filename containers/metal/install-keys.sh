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
