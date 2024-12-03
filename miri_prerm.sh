#!/usr/bin/bash

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    sudo -u $user -- $dir/.cargo/bin/rustup +nightly component remove miri
done

