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
    mkdir -p /home/$user/.config/betterlockscreen
    cp /etc/skel/.config/betterlockscreen/betterlockscreenrc /home/$user/.config/betterlockscreen/betterlockscreenrc
    chown $user:$user /home/$user/.config/betterlockscreen/betterlockscreenrc
    cp /etc/skel/.config/picom.conf /home/$user/.config/picom.conf
    chown $user:$user /home/$user/.config/picom.conf
    mkdir -p /home/$user/.config/flameshot
    cp /etc/skel/.config/flameshot/flameshot.ini /home/$user/.config/flameshot/flameshot.ini
    chown $user:$user /home/$user/.config/flameshot/flameshot.ini
    if [[ ! -f "/home/$user/.local/why-bg" ]]; then
        sudo -u $user -- betterlockscreen -u /usr/share/backgrounds/bg1440.png

        if pgrep -x i3 -u $user; then
            sudo -u $user -- betterlockscreen -w
        fi

        mkdir -p /home/$user/.local
        touch /home/$user/.local/why-bg
        chown $user:$user /home/$user/.local/why-bg
    fi
done

