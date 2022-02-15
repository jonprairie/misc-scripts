#!/usr/bin/env bash

HOME=$2

for f in $HOME/bin/misc-scripts/*.sh
do
    chmod +x $f
done
