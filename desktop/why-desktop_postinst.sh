#!/usr/bin/bash

set -e

if test -f /etc/lightdm/lightdm-gtk-greeter.conf; then
    mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.old
fi
mv /etc/lightdm/lightdm-gtk-greeter.conf.why /etc/lightdm/lightdm-gtk-greeter.conf

mkdir -p /usr/share/desktop-directories/

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    mkdir -p /home/$user/.config/
    chown $user:$user /home/$user/.config
    mkdir -p /home/$user/.config/i3/
    cp /etc/skel/.config/i3/config /home/$user/.config/i3/config
    chown -R $user:$user /home/$user/.config/i3
    mkdir -p /home/$user/.config/i3blocks/
    cp /etc/skel/.config/i3blocks/i3blocks.conf /home/$user/.config/i3blocks/i3blocks.conf
    chown -R $user:$user /home/$user/.config/i3blocks
    mkdir -p /home/$user/.config/betterlockscreen
    cp /etc/skel/.config/betterlockscreen/betterlockscreenrc /home/$user/.config/betterlockscreen/betterlockscreenrc
    chown -R $user:$user /home/$user/.config/betterlockscreen
    cp /etc/skel/.config/picom.conf /home/$user/.config/picom.conf
    chown $user:$user /home/$user/.config/picom.conf
done

