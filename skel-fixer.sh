#!/usr/bin/bash

cp -rfv /etc/skel/* $HOME
chown -Rf $user:$user $HOME

