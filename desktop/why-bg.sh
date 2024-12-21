#!/usr/bin/bash

while getopts "li" option; do
    case $option in
        l)
            ls /usr/share/backgrounds/
            exit;;
        i)
            echo "Importing background..."
            betterlockscreen -u $2
            betterlockscreen -w
            exit;;
    esac
done

echo "Selecting background..."
betterlockscreen -u /usr/share/backgrounds/$1
betterlockscreen -w

