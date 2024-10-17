#!/usr/bin/bash

mkdir /home/$SUBJECT
chown $SUBJECT:$SUBJECT /home/$SUBJECT
sudo -u $SUBJECT -- /usr/bin/skel-fixer

