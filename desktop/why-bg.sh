#!/usr/bin/bash

while getopts "lir" option; do
    case $option in
        l)
            ls /usr/share/backgrounds/
            exit;;
        i)
            echo "Importing background..."
            mkdir -p ~/.local/share/backgrounds/
            cp $2 "~/.local/share/backgrounds/${basename $2}"
            echo "~/.local/share/backgrounds/${basename $2}" > ~/.local/why-bg-path
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

