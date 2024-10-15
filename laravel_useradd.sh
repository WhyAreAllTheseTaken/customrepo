#!/usr/bin/bash    

mkdir /home/$SUBJECT
chown $SUBJECT:$SUBJECT /home/$SUBJECT
sudo -u $SUBJECT -- composer global require laravel/installer

