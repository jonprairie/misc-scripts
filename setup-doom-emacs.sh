#!/usr/bin/env bash

USER=$1
HOME=$2

git clone https://github.com/hlissner/doom-emacs $HOME/.emacs.d
yes | $HOME/.emacs.d/bin/doom install
