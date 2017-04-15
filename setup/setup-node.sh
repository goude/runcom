#!/bin/bash

npm install -g htmlhint write-good jsonlint base16-builder-node

# build base16
cd $HOME/.homesick/repos/runcom/base16
base16 builder
