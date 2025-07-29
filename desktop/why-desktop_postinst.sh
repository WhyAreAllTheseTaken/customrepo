#!/usr/bin/bash

set -e

if test -f /etc/lightdm/lightdm-gtk-greeter.conf; then
    mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.old
fi
mv /etc/lightdm/lightdm-gtk-greeter.conf.why /etc/lightdm/lightdm-gtk-greeter.conf

mkdir -p /usr/share/desktop-directories/

mkdir -p /etc/skel/.local/desk
mkdir -p /etc/skel/down
mkdir -p /etc/skel/.local/template
mkdir -p /etc/skel/.pub
mkdir -p /etc/skel/doc
mkdir -p /etc/skel/mus
mkdir -p /etc/skel/pic
mkdir -p /etc/skel/vid

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    mkdir -p /home/$user/.config/
    chown $user:$user /home/$user/.config
    mkdir -p /home/$user/.config/i3/
    cp /etc/skel/.config/i3/config /home/$user/.config/i3/config
    chown -R $user:$user /home/$user/.config/i3
    mkdir -p /home/$user/.config/dunst/
    cp /etc/skel/.config/dunst/dunstrc /home/$user/.config/dunst/dunstrc
    chown -R $user:$user /home/$user/.config/dunst
    mkdir -p /home/$user/.config/i3blocks/
    cp /etc/skel/.config/i3blocks/i3blocks.conf /home/$user/.config/i3blocks/i3blocks.conf
    chown -R $user:$user /home/$user/.config/i3blocks
    mkdir -p /home/$user/.config/betterlockscreen
    cp /etc/skel/.config/betterlockscreen/betterlockscreenrc /home/$user/.config/betterlockscreen/betterlockscreenrc
    chown -R $user:$user /home/$user/.config/betterlockscreen
    cp /etc/skel/.config/picom.conf /home/$user/.config/picom.conf
    chown $user:$user /home/$user/.config/picom.conf
    cp /etc/skel/.config/user-dirs.dirs /home/$user/.config/user-dirs.dirs
    chown $user:$user /home/$user/.config/user-dirs.dirs
    cp /etc/skel/.config/user-dirs.locale /home/$user/.config/user-dirs.locale
    chown $user:$user /home/$user/.config/user-dirs.locale
    mkdir -p /home/$user/.local/desk
    mkdir -p /home/$user/down
    mkdir -p /home/$user/.local/template
    mkdir -p /home/$user/.pub
    mkdir -p /home/$user/doc
    mkdir -p /home/$user/mus
    mkdir -p /home/$user/pic
    mkdir -p /home/$user/vid
    chown $user:$user /home/$user/.local
    chown $user:$user /home/$user/.local/desk
    chown $user:$user /home/$user/down
    chown $user:$user /home/$user/.local/template
    chown $user:$user /home/$user/.pub
    chown $user:$user /home/$user/doc
    chown $user:$user /home/$user/mus
    chown $user:$user /home/$user/pic
    chown $user:$user /home/$user/vid
done

