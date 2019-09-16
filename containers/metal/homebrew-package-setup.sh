#!/bin/bash

echo Installing base packages...

PACKAGES=$(cat ../homebrew-list)
echo $PACKAGES
brew install $PACKAGES

echo Also need to enable docker...
# brew tap cask...
# brew cask install docker
