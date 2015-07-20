#!/bin/bash

echo Syntastic requires installed syntax checkers to work.
echo For a list, please see https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers
echo Ack.vim requires ack to work. Instructions on installing ack can be found http://beyondgrep.com/install/

git submodule update --init
cp ./.vimrc  ~/.vimrc
