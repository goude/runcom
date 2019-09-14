#!/bin/bash

echo Installing base packages...

PACKAGES=$(cat ../homebrew-list)
echo $PACKAGES
brew install $PACKAGES
