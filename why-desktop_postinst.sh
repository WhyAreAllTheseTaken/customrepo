#!/usr/bin/bash

if test -f /etc/lightdm/lightdm-gtk-greeter.conf; then
    mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.old
fi
mv /etc/lightdm/lightdm-gtk-greeter.conf.why /etc/lightdm/lightdm-gtk-greeter.conf

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    mkdir -p /home/$user/.config/dunst/
    cp /etc/skel/.config/dunst/dunstrc /home/$user/.config/dunst/dunstrc
    chown $user:$user /home/$user/.config/dunst/dunstrc
    mkdir -p /home/$user/.config/i3/
    cp /etc/skel/.config/i3/config /home/$user/.config/i3/config
    chown $user:$user /home/$user/.config/i3/config
    mkdir -p /home/$user/.config/i3blocks/
    cp /etc/skel/.config/i3blocks/i3blocks.conf /home/$user/.config/i3blocks/i3blocks.conf
    chown $user:$user /home/$user/.config/i3blocks/i3blocks.conf
    mkdir -p /home/$user/.config/rofi/themes/
    cp /etc/skel/.config/rofi/config.rasi /home/$user/.config/rofi/config.rasi
    chown $user:$user /home/$user/.config/rofi/config.rasi
    cp /etc/skel/.config/rofi/themes/Ice.rasi /home/$user/.config/rofi/themes/Ice.rasi
    chown $user:$user /home/$user/.config/rofi/themes/Ice.rasi
    cp /etc/skel/.config/betterlockscreenrc /home/$user/.config/betterlockscreenrc
    chown $user:$user /home/$user/.config/betterlockscreenrc
    cp /etc/skel/.config/picom.conf /home/$user/.config/picom.conf
    chown $user:$user /home/$user/.config/picom.conf
    mkdir -p /home/$user/.config/flameshot
    cp /etc/skel/.config/flameshot/flameshot.ini /home/$user/.config/flameshot/flameshot.ini
    chown $user:$user /home/$user/.config/flameshot/flameshot.ini
    if [[ ! -f "/home/$user/.local/share/backgrounds/bg.png" ]]; then
        mkdir -p /home/$user/.local/share/backgrounds
        cp /etc/skel/.local/share/backgrounds/bg.png /home/$user/.local/share/backgrounds/bg.png
    fi
done

