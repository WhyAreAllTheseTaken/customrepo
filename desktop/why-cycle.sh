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
init_theme "00" night
init_theme "01" night
init_theme "02" night
init_theme "03" night
init_theme "04" night
init_theme "05" night
init_theme "06" dawn
init_theme "07" dawn
init_theme "08" dawn
init_theme "09" dawn
init_theme "10" dawn
init_theme "11" ice
init_theme "12" ice
init_theme "13" ice
init_theme "14" ice
init_theme "15" ice
init_theme "16" ice
init_theme "17" ice
init_theme "18" ice
init_theme "19" pink
init_theme "20" pink
init_theme "21" pink
init_theme "22" pink
init_theme "23" night

while getopts "lrhynsd" option; do
    case $option in
        d)
            mkdir -p ~/.config/why-cycle
            echo night > ~/.config/why-cycle/00
            echo night > ~/.config/why-cycle/01
            echo night > ~/.config/why-cycle/02
            echo night > ~/.config/why-cycle/03
            echo night > ~/.config/why-cycle/04
            echo night > ~/.config/why-cycle/05
            echo dawn > ~/.config/why-cycle/06
            echo dawn > ~/.config/why-cycle/07
            echo dawn > ~/.config/why-cycle/08
            echo dawn > ~/.config/why-cycle/09
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
            for hour in $(seq -f "%02g" 0 23);
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

