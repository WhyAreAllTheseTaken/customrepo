#!/usr/bin/bash

function swap_theme() {
    current=$(cat ~/.local/why-theme)

    echo "Checking theme change requirement: $current -> $1..."

    if [[ $current != $1 ]]; then
        why-theme -b $1
    fi
}

while getopts "rhed" option; do
    case $option in
        r)
            echo "Refreshing theme..."
            if [[ -f ~/.config/why-cycle-enable ]]; then
                hour=$(date +"%H")

                echo "Hour: $hour"

                case $hour in
                    0 | 1 | 2 | 3 | 4 | 5)
                        swap_theme night;;
                    6 | 7 | 8 | 9 | 10 | 11)
                        swap_theme dawn;;
                    12 | 13 | 14 | 15 | 16 | 17 | 18)
                        swap_theme ice;;
                    19 | 20 | 21)
                        swap_theme pink;;
                    22 | 23)
                        swap_theme night;;
                esac
            else
                echo "why-cycle is not enabled by this user."
            fi
            exit;;
        h)
            echo "Available options:"
            echo "-r - Checks to see if a new theme should be set."
            echo "-h - Displays this help page."
            echo "-e - Enables cycle themes for this user."
            echo "-d - Disables cycle themes for this user."
            exit;;
        e)
            echo "Enabling theme cycling..."
            touch ~/.config/why-cycle-enable
            why-cycle -r
            exit;;
        d)
            echo "Disabling theme cycling..."
            rm ~/.config/why-cycle-enable
            exit;;
    esac
done

echo "You must specify an option for this command."
echo "Use why-cycle -h to see a list of available options."

exit 1

