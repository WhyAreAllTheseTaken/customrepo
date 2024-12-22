#!/usr/bin/bash

while getopts "lrd" option; do
    case $option in
        l)
            echo "Available themes:"
            ls /usr/share/why-desktop/theme/
            exit;;
        r)
            echo "Reloading theme..."
            why-theme "$(<~/.local/why-theme)"
            exit;;
    esac
done

echo "Using theme $1..."

echo $1 > ~/.local/why-theme

cp -rTf /usr/share/why-desktop/theme/$1/config/ ~/.config
cp -rTf /usr/share/why-desktop/theme/$1/home/ ~

i3-msg reload || true
pkill -USR1 kitty || true
pkill -USR1 zsh || true

