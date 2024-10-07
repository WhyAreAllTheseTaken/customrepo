#!/usr/bin/bash

mkdir -p /etc/skel/uni

for dir in /home/*/
do
    dir=${dir%*/}
    sudo -u $user -- mkdir -p $dir/uni/
done


