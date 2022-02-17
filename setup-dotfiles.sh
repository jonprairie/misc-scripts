#!/usr/bin/env bash

USER=$1
HOME=$2
REPO=$3

cd $HOME

shopt -s dotglob
FILES=$HOME/*

for f in $FILES
do
    echo "moving $f to $f.old"
    mv "$f" "$f".old
done

git init
git remote add origin $REPO
git pull origin master

for f in $HOME/*.old
do
    basef=$(basename "$f" .old)
    echo "checking for $basef"
    if [ -e $f ]; then
        "$basef already exists! leaving $f alone."
    else
        echo "moving $f back to $basef"
        mv $f $basef
    fi
done

shopt -u dotglob
