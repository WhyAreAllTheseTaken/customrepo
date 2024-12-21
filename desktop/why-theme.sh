#!/usr/bin/bash

while getopts "l" option; do
   case $option in
      l)
         echo "Available themes:"
         echo "- ice"
         exit;;
   esac
done

echo "Using theme $1..."
cp -rf /usr/share/why-desktop/themes/$1/ ~

