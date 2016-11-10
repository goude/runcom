#!/bin/bash
PACKAGES=$(cat base development)

echo $PACKAGES

apt-get update && apt-get install $PACKAGES
