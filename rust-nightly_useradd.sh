#!/usr/bin/bash

mkdir /home/$SUBJECT
chown $SUBJECT:$SUBJECT /home/$SUBJECT
sudo -u $SUBJECT -- /home/$SUBJECT/.cargo/bin/rustup install stable

