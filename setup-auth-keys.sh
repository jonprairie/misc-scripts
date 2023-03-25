#!/usr/bin/env bash

USER=$1
HOME=$2
REPO=$3

if [ ! -e "$HOME/.ssh" ]; then
    mkdir -p $HOME/.ssh
fi

if [ -e "$HOME/.ssh/authorized_keys" ]; then
    mv $HOME/.ssh/authorized_keys $HOME/.ssh/authorized_keys2
fi

cd $HOME/.ssh
git init
git remote add origin $REPO
git pull origin master

if [ -e "$HOME/.ssh/authorized_keys2" ]; then
    cat $HOME/.ssh/authorized_keys2 >> $HOME/.ssh/authorized_keys
fi
