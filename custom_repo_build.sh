#!/usr/bin/bash

cd /usr/customrepo && sudo -u customrepo -- git pull origin master
cd /usr/customrepo && sudo -u customrepo -- make repo
cd /usr/customrepo/repo && sudo -u customrepo -- dpkg-scanpackages -m . /dev/null | gzip -9c > Packages.gz

