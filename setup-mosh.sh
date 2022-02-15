#!/usr/bin/env bash

HOME=$2

cd $HOME

git clone https://github.com/mobile-shell/mosh
cd mosh
./autogen.sh
./configure
make
make install

cd $HOME

rm -rf mosh
