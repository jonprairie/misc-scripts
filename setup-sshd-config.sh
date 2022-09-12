#!/usr/bin/env bash

HOME=$2

if [ -e /etc/ssh/sshd_config ]; then
    echo "moving old config to /etc/ssh/sshd_config.old"
    mv /etc/ssh/sshd_config /etc/ssh/sshd_config.old
fi

cp $HOME/bin/misc-scripts/sshd_config /etc/ssh/sshd_config

systemctl enable ssh.service
