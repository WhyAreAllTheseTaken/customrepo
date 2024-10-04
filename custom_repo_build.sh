#!/usr/bin/bash

apt update
cd /usr/customrepo && sudo -u customrepo -- git pull origin master
cd /usr/customrepo && sudo -u customrepo -- make updater
cd /usr/customrepo && make install
cd /usr/customrepo/repo && sudo -u customrepo -- dpkg-scanpackages -m . /dev/null | gzip -9c > Packages.gz
apt update

