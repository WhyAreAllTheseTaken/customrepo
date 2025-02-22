#!/usr/bin/bash

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    systemctl -M "$user@" --user daemon-reload
    systemctl -M "$user@" --user start why-cycle.service
done
systemctl --global enable why-cycle.timer

