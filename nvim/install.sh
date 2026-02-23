#!/usr/bin/bash

post_install() {
    for dir in /home/*/
    do
        dir=${dir%*/}
        user=${dir##*/}
        sudo -u $user -- mkdir -p /home/$user/.config/nvim 
        sudo -u $user -- cp -r /etc/skel/.config/nvim/* /home/$user/.config/nvim
    done
}

post_upgrade() {
    post_install
}
