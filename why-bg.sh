#!/usr/bin/bash

while getopts "r" option; do
   case $option in
      r)
         echo "Resetting to the default background."
         betterlockscreen -u /usr/share/backgrounds/bg1440.png
         betterlockscreen -w
         exit;;
   esac
done

betterlockscreen -u $0
betterlockscreen -w

