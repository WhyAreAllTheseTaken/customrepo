#!/usr/bin/bash

post_install() {
    for dir in /home/*/
    do
        dir=${dir%*/}
        user=${dir##*/}
        sudo -u $user -- why-bg -r
        sudo -u $user -- why-theme -r
    done
}

post_upgrade() {
    post_install
}

