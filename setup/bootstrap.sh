#!/usr/bin/env bash
echo "Bootstrapping runcom..."

mkdir -p "$HOME/tmp"
cd "$HOME/tmp"
git clone https://github.com/goude/runcom.git
cd runcom/setup
./install.sh
