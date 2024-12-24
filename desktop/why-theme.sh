#!/usr/bin/bash

while getopts "lrbh" option; do
    case $option in
        l)
            echo "Available themes:"
            ls /usr/share/why-desktop/theme/
            exit;;
        r)
            echo "Reloading theme..."
            why-theme "$(<~/.local/why-theme)"
            exit;;
        b)
            echo "Using theme background..."
            bg_file=/usr/share/why-desktop/theme/$2/default-bg
            why-bg $(cat $bg_file)
            why-theme $2
            exit;;
        h)
            echo "why-theme help:"
            echo "-l - List available themes."
            echo "-r - Reload current theme."
            echo "-b - Include the theme background."
            echo "-h - Display this help."
            exit;;
    esac
done

echo "Using theme $1..."

echo $1 > ~/.local/why-theme

cp -rTf /usr/share/why-desktop/theme/$1/config/ ~/.config
cp -rTf /usr/share/why-desktop/theme/$1/home/ ~

i3-msg reload > /dev/null || true
pkill -USR1 kitty || true
pkill -USR1 zsh || true

