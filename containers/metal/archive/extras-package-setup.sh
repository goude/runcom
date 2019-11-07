#!/bin/bash

echo Installing extra packages...

PACKAGES=$(cat ../extras-list)
echo $PACKAGES
apt-get -y update && apt-get -y install $PACKAGES
