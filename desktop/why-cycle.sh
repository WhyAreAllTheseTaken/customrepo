#!/usr/bin/bash

function swap_theme() {
    current=$(cat ~/.local/why-theme)

    echo "Checking theme change requirement: $current -> $1..."

    if [[ $current != $1 ]]; then
        why-theme -b $1
    fi
}

hour=$(date +"%H")

echo "Hour: $hour"

case $hour in
    0 | 1 | 2 | 3 | 4 | 5)
        swap_theme("pink");;
    6 | 7 | 8 | 9 | 10 | 11 | 12)
        swap_theme("dawn");;
    13 | 14 | 15 | 16 | 17 | 18)
        swap_theme("ice");;
    19 | 20 | 21 | 22 | 23)
        swap_theme("pink");;
esac

