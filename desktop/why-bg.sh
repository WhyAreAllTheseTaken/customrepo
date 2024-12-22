#!/usr/bin/bash

while getopts "lir" option; do
    case $option in
        l)
            ls /usr/share/backgrounds/
            exit;;
        i)
            echo "Importing background..."
            mkdir -p ~/.local/share/backgrounds/
            name=$(basename $2)
            cp -vf $2 "~/.local/share/backgrounds/$name"
            echo "~/.local/share/backgrounds/$name" > ~/.local/why-bg-path
            why-bg -r
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

why-bg -r

