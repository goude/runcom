#!/usr/bin/env bash
echo "Setting up rcpy..."

./setup-pyenv.sh
(cd rcpy && ./setup.sh)
(cd rcpy/python3 && ./setup.sh)
#(cd rcpy/python2 && ./setup.sh)
