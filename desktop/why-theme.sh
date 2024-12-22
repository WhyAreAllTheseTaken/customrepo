#!/usr/bin/bash

while getopts "lr" option; do
   case $option in
      l)
         echo "Available themes:"
         ls /usr/share/why-desktop/theme/
         exit;;
      r)
         echo "Resetting theme."
         why-theme "$(<~/.local/why-theme)"
         exit;;
   esac
done

echo "Using theme $1..."

echo $1 > ~/.local/why-theme

cp -rTf /usr/share/why-desktop/theme/$1/config/ ~/.config
cp -rTf /usr/share/why-desktop/theme/$1/home/ ~

set -e
i3-msg reload
pkill -USR1 -f /usr/bin/kitty

