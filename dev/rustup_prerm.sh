#!/usr/bin/bash

if [ $1 = "remove" ]; then
    for dir in /home/*/
    do
        dir=${dir%*/}
        user=${dir##*/}
        sudo -u $user -- $dir/.cargo/bin/rustup self uninstall -y
    done
fi

