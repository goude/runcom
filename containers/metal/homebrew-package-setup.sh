#!/bin/bash

echo Installing base packages...

PACKAGES=$(cat ../homebrew-list)
echo $PACKAGES
brew install $PACKAGES

CASKS=$(cat ../homebrew-cask-list)
echo $CASKS
brew cask install $CASKS 
