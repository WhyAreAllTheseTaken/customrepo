#!/usr/bin/bash

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    sudo -u $user -- rustup uninstall 1.83.0
done

