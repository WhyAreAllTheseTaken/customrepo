#!/usr/bin/bash

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    sudo -u $user -- /usr/share/rustup_deb/rustup_setup.sh -y
done

