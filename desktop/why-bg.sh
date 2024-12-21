#!/usr/bin/bash

while getopts "l" option; do
    case $option in
        l)
            ls /usr/share/backgrounds/
            exit;;
        i)
            echo "Importing background..."
            betterlockscreen -u $1
            betterlockscreen -w
            exit;;
    esac
done

echo "Selecting background..."
betterlockscreen -u /usr/share/backgrounds/$1
betterlockscreen -w

