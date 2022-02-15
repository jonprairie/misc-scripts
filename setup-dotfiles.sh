#!/usr/bin/env bash

USER=$1
HOME=$2
REPO=$3

cd $HOME
git init
git remote add origin $REPO
git pull origin master
