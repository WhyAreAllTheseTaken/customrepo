#!/usr/bin/bash

mkdir -p /etc/skel/dev

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    sudo -u $user -- mkdir -p $dir/dev/
done

