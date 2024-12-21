#!/usr/bin/bash

while getopts "rl" option; do
    case $option in
        r)
            echo "Resetting to the default background..."
            betterlockscreen -u /usr/share/backgrounds/bg1440.png
            betterlockscreen -w
            exit;;
        l)
            ls /usr/share/backgrounds/
            exit;;
    esac
done

betterlockscreen -u $1
betterlockscreen -w

