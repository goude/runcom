#!/bin/bash
cd ~/.vim/bundle && rm -rf YouCompleteMe && git clone https://github.com/Valloric/YouCompleteMe.git && cd YouCompleteMe && git reset --hard 0de1c0c && git submodule update --init --recursive && ./install.py
