#!/usr/bin/bash

post_install() {
    for dir in /home/*/
    do
        dir=${dir%*/}
        user=${dir##*/}
        systemctl -M "$user@" --user daemon-reload
        systemctl -M "$user@" --user start why-cycle.service
    done
    systemctl --global enable why-cycle.timer
}

post_remove() {
    for dir in /home/*/
    do
        dir=${dir%*/}
        user=${dir##*/}
        systemctl -M "$user@" --user daemon-reload
    done
}

pre_remove() {
    systemctl --global disable why-cycle.timer
}

pre_upgrade() {
    pre_remove
}

post_upgrade() {
    post_install
}


