#!/usr/bin/bash

if test -f /etc/lightdm/lightdm-gtk-greeter.conf; then
    mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf.old
fi
mv /etc/lightdm/lightdm-gtk-greeter.conf.why /etc/lightdm/lightdm-gtk-greeter.conf

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    mkdir -p /home/$user/.config/i3/
    cp /etc/skel/.config/i3/config /home/$user/.config/i3/config
    chown $user:$user /home/$user/.config/i3/config
    mkdir -p /home/$user/.config/i3blocks/
    cp /etc/skel/.config/i3blocks/i3blocks.conf /home/$user/.config/i3blocks/i3blocks.conf
    chown $user:$user /home/$user/.config/i3blocks/i3blocks.conf
    mkdir -p /home/$user/.config/betterlockscreen
    cp /etc/skel/.config/betterlockscreen/betterlockscreenrc /home/$user/.config/betterlockscreen/betterlockscreenrc
    chown $user:$user /home/$user/.config/betterlockscreen/betterlockscreenrc
    cp /etc/skel/.config/picom.conf /home/$user/.config/picom.conf
    chown $user:$user /home/$user/.config/picom.conf
    if [[ ! -f /home/$user/.local/why-theme ]]; then
        echo "ice" > "/home/$user/.local/why-theme"
        chown $user:$user "/home/$user/.local/why-theme"
    fi
    if [[ ! -f /home/$user/.local/why-bg-path ]]; then
        echo "/usr/share/backgrounds/why-ice.png" > "/home/$user/.local/why-bg-path"
        chown $user:$user "/home/$user/.local/why-bg-path"
    fi
    sudo -u $user -- why-bg -r
    sudo -u $user -- why-theme -r
done

