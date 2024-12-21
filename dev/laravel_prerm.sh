#!/usr/bin/bash

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    sudo -u $user -- composer global remove laravel/installer
done



