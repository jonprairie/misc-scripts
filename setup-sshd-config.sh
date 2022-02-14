#!/usr/bin/env bash

HOME=$2

if [ -e /etc/ssh/sshd_config ]; then
    mv /etc/ssh/sshd_config /etc/ssh/sshd_config.old
fi

cp $HOME/misc-scripts/sshd_config /etc/ssh/sshd_config
