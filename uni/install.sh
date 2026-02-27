#!/usr/bin/bash

post_install() {
    mkdir -p /etc/skel/uni

    for dir in /home/*/
    do
        dir=${dir%*/}
        user=${dir##*/}
        sudo -u $user -- mkdir -p $dir/uni/
    done
}

post_upgrade() {
    post_install
}
