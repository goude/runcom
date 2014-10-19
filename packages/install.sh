#!/bin/bash
PACKAGES=$(cat base development)
echo $PACKAGES
apt-get install $PACKAGES
