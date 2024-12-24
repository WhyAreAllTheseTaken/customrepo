#!/usr/bin/bash

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    systemctl -M "$user@" --user daemon-reload
done


