#!/usr/bin/env bash
echo "Bootstrapping runcom..."

mkdir -p "$HOME/tmp"
cd "$HOME/tmp" || exit
git clone https://github.com/goude/runcom.git
cd runcom/setup || exit
./install.sh
