#!/bin/bash

echo Installing base packages...

PACKAGES=$(cat ../master-list)
echo $PACKAGES
apt-get -y update && apt-get -y install $PACKAGES
