#!/bin/bash
export PATH=$HOME/.rbenv/bin:$PATH

eval "$(rbenv init -)"
rbenv install 2.4.1
rbenv global 2.4.1
rbenv rehash
