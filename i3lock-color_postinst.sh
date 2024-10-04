#!/usr/bin/bash

cd /usr/share/i3lock-color-build/build
make install
LICENSE='/usr/share/licenses/i3lock-color/LICENSE'
sudo install -Dm644 ../LICENSE "$LICENSE"

