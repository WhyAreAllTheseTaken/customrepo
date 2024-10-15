#!/usr/bin/bash

shopt -s dotglob

cp -rfv /etc/skel/* $HOME
chown -Rf $user:$user $HOME

