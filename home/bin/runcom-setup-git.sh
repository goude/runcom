#!/bin/bash
echo "Setting up default git configuration."

git config --global user.name "Daniel Goude"
git config --global user.email "daniel@goude.se"
git config --global push.default simple

git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
#git config --global difftool.prompt false

git config --global --unset http.sslVerify
git config --global --unset http.sslCAinfo

git config --list



