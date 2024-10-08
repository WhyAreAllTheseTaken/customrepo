#!/usr/bin/bash

cd /usr/customrepo && sudo -u customrepo -- git pull origin master
cd /usr/customrepo && sudo -u customrepo -- make -s --debug=b build
cd /usr/customrepo && sudo -u customrepo -- make -s --debug=b --keep-going packages
cd /usr/customrepo && sudo -u customrepo -- dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz

