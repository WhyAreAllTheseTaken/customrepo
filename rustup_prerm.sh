#!/usr/bin/bash

if [ $1 = "remove" ]; then
    for dir in /home/*/
    do
        dir=${dir%*/}
        user=${dir##*/}
        sudo -u $user -- rustup self uninstall -y
    done
fi

