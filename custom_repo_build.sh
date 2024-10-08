#!/usr/bin/bash

cd /usr/customrepo && sudo -u customrepo -- git pull origin master
cd /usr/customrepo && sudo -u customrepo -- make -s build
cd /usr/customrepo && make install
cd /usr/customrepo && sudo -u customrepo -- make -s --keep-going packages
cd /usr/customrepo && sudo -u customrepo -- dpkg-scanpackages -m . /dev/null | gzip -9c > Packages.gz

