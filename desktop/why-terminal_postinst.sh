#!/usr/bin/bash

set -e

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    mkdir -p /home/$user/.config/
    chown $user:$user /home/$user/.config
    mkdir -p /home/$user/.config/alacritty/
    chown $user:$user /home/$user/.config/alacritty
    cp /etc/skel/.config/alacritty/alacritty.toml /home/$user/.config/alacritty/alacritty.toml
    chown $user:$user /home/$user/.config/alacritty/alacritty.toml
done

