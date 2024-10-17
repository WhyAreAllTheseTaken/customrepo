#!/usr/bin/bash

mkdir /home/$SUBJECT
chown $SUBJECT:$SUBJECT /home/$SUBJECT
sudo -u $SUBJECT -- /usr/share/rustup_deb/rustup_setup.sh -y

