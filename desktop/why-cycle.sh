#!/usr/bin/bash

function swap_theme() {
    current=$(cat ~/.local/why-theme)

    echo "Checking theme change requirement: $current -> $1..."

    if [[ $current != $1 ]]; then
        why-theme -b $1
    fi
}

function init_theme() {
    if [[ ! -f ~/.config/why-cycle/$1 ]]; then
        echo "$2" > ~/.config/why-cycle/$1
    fi
}

mkdir -p ~/.config/why-cycle
init_theme 0 night
init_theme 1 night
init_theme 2 night
init_theme 3 night
init_theme 4 night
init_theme 5 night
init_theme 6 dawn
init_theme 7 dawn
init_theme 8 dawn
init_theme 9 dawn
init_theme 10 dawn
init_theme 11 ice
init_theme 12 ice
init_theme 13 ice
init_theme 14 ice
init_theme 15 ice
init_theme 16 ice
init_theme 17 ice
init_theme 18 ice
init_theme 19 pink
init_theme 20 pink
init_theme 21 pink
init_theme 22 pink
init_theme 23 night

while getopts "lrhynsd" option; do
    case $option in
        d)
            mkdir -p ~/.config/why-cycle
            echo night > ~/.config/why-cycle/0
            echo night > ~/.config/why-cycle/1
            echo night > ~/.config/why-cycle/2
            echo night > ~/.config/why-cycle/3
            echo night > ~/.config/why-cycle/4
            echo night > ~/.config/why-cycle/5
            echo dawn > ~/.config/why-cycle/6
            echo dawn > ~/.config/why-cycle/7
            echo dawn > ~/.config/why-cycle/8
            echo dawn > ~/.config/why-cycle/9
            echo dawn > ~/.config/why-cycle/10
            echo ice > ~/.config/why-cycle/11
            echo ice > ~/.config/why-cycle/12
            echo ice > ~/.config/why-cycle/13
            echo ice > ~/.config/why-cycle/14
            echo ice > ~/.config/why-cycle/15
            echo ice > ~/.config/why-cycle/16
            echo ice > ~/.config/why-cycle/17
            echo ice > ~/.config/why-cycle/18
            echo pink > ~/.config/why-cycle/19
            echo pink > ~/.config/why-cycle/20
            echo pink > ~/.config/why-cycle/21
            echo pink > ~/.config/why-cycle/22
            echo night > ~/.config/why-cycle/23
            
            why-cycle -r
            exit;;
        l)
            for hour in $(seq 0 23);
            do
                path=~/.config/why-cycle/$hour
                theme=$(cat $path)

                echo "$hour: $theme"
            done
            exit;;
        s)
            if [[ -d /usr/share/why-desktop/theme/$3 ]]; then
                echo $3 > ~/.config/why-cycle/$2
                
                why-cycle -r
            else
                echo "The theme '$3' does not exist." >&2
            fi
            exit;;
        r)
            echo "Refreshing theme..."

            if [[ -f ~/.config/why-cycle/enabled ]]; then
                hour=$(date +"%H")

                echo "Hour: $hour"

                path=~/.config/why-cycle/$hour
                swap_theme $(cat $path)
            else
                echo "why-cycle is not enabled by this user."
            fi
            exit;;
        h)
            echo "Available Commands:"
            echo "-r - Checks to see if a new theme should be set."
            echo "-s <hour> <theme> - Sets the theme for the specified hour."
            echo "-l - Lists what theme is used for each hour."
            echo "-h - Displays this help page."
            echo "-y - Enables cycle themes for this user."
            echo "-n - Disables cycle themes for this user."
            echo "-d - Reset to default options."
            exit;;
        y)
            echo "Enabling theme cycling..."
            mkdir -p ~/.config/why-cycle
            touch ~/.config/why-cycle/enabled
            why-cycle -r
            exit;;
        n)
            echo "Disabling theme cycling..."
            mkdir -p ~/.config/why-cycle
            rm ~/.config/why-cycle/enabled
            exit;;
    esac
done

echo "You must specify an option for this command."
echo "Use why-cycle -h to see a list of available options."

exit 1

