#!/bin/bash
export PATH=$HOME/.rbenv/bin:$PATH

eval "$(rbenv init -)"
rbenv install "$RUNCOM_RBENV_RUBY_VERSION"
rbenv global "$RUNCOM_RBENV_RUBY_VERSION"
rbenv rehash

gem install colorls
