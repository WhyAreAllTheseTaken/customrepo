#!/usr/bin/bash

while getopts "l" option; do
   case $option in
      l)
         echo "Available themes:"
         ls /usr/share/why-desktop/themes/
         exit;;
   esac
done

echo "Using theme $1..."
cp -rf /usr/share/why-desktop/themes/$1/config/* ~/.config
cp -rf /usr/share/why-desktop/themes/$1/home/* ~

