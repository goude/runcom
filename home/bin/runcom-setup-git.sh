#!/bin/bash
echo "Setting up default git configuration."

git config --global user.name "Daniel Goude"
git config --global user.email "daniel@goude.se"
git config --global push.default simple

git config --list
