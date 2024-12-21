#!/usr/bin/bash

for dir in /home/*/
do
    dir=${dir%*/}
    user=${dir##*/}
    sudo -u $user BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_GHC_VERSION=latest BOOTSTRAP_HASKELL_CABAL_VERSION=latest \
        BOOTSTRAP_HASKELL_INSTALL_STACK=1 BOOTSTRAP_HASKELL_INSTALL_HLS=1 BOOTSTRAP_HASKELL_ADJUST_BASHRC=P -- /usr/share/ghcup_deb/ghcup_setup.sh -y
done

