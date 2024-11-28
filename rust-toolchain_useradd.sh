#!/usr/bin/bash

mkdir /home/$SUBJECT
chown $SUBJECT:$SUBJECT /home/$SUBJECT
sudo -u $SUBJECT -- rustup install 1.83.0


