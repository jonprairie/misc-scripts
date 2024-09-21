#!/usr/bin/env bash

USER=$1
HOME=$2
REPO=$3

mkdir -p "$HOME/.config"
cd "$HOME/.config" || exit

git clone https://github.com/hlissner/doom-emacs emacs
yes | ./emacs/bin/doom install
git clone "$REPO" doom.new

mv doom doom.old
mv doom.new doom
