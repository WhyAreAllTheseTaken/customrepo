#!/usr/bin/bash

mkdir -p /etc/skel/uni

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    sudo -u $user -- mkdir -p $dir/uni/
done


