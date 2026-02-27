#!/usr/bin/bash

post_install() {
    mkdir -p /etc/skel/dev

    for dir in /home/*/
    do
        dir=${dir%*/}
        user=${dir##*/}
        sudo -u $user -- mkdir -p $dir/dev/
    done
}

post_upgrade() {
    post_install
}

