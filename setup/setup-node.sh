#!/bin/bash

npm install -g htmlhint write-good jsonlint base16-builder-node

# build base16
mkdir -p $HOME/.local/share/base16
cd $HOME/.local/share/base16
base16 builder
