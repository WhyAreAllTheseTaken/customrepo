#!/usr/bin/bash

while getopts "l" option; do
   case $option in
      l)
         echo "Available themes:"
         ls /usr/share/why-desktop/theme/
         exit;;
   esac
done

echo "Using theme $1..."
cp -rTf /usr/share/why-desktop/theme/$1/config/* ~/.config
cp -rTf /usr/share/why-desktop/theme/$1/home/* ~

