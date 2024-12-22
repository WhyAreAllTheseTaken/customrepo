#!/usr/bin/bash

while getopts "lir" option; do
    case $option in
        l)
            ls /usr/share/backgrounds/
            exit;;
        i)
            echo "Importing background..."
            name=$(basename $2)
            mkdir -p ~/.local/share/backgrounds/
            cp -vf $2 "~/.local/share/backgrounds/"
            path=$(realpath ~/local/share/backgrounds/$name)
            echo "$path" > ~/.local/why-bg-path
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

