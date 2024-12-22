#!/usr/bin/bash

set -e

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    cp /etc/skel/.zshenv /home/$user/
    chown $user:$user /home/$user/.zshenv
    cp /etc/skel/.zshrc /home/$user/
    chown $user:$user /home/$user/.zshrc
    cp /etc/skel/.zshrc.zni /home/$user/
    chown $user:$user /home/$user/.zshrc.zni
done


