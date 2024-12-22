#!/usr/bin/bash

while getopts "lir" option; do
    case $option in
        l)
            ls /usr/share/backgrounds/
            exit;;
        i)
            echo "Importing background..."
            mkdir -p ~/.local/share/backgrounds/
            cp $2 ~/.local/share/backgrounds/user
            echo "~/.local/share/backgrounds/user" > ~/.local/why-bg-path
            betterlockscreen -u "~/.local/share/backgrounds/user"
            betterlockscreen -w
            exit;;
        r)
            echo "Reloading background..."
            betterlockscreen -u "$(<~/.local/why-bg-path)"
            betterlockscreen -w
            exit;;
    esac
done

echo "Selecting background..."

echo "/usr/share/backgrounds/$1" > ~/.local/why-bg-path

betterlockscreen -u /usr/share/backgrounds/$1
betterlockscreen -w

