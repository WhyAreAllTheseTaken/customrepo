#!/usr/bin/bash

cd /usr/customrepo && git pull origin master
cd /usr/customrepo && make
cd /usr/customrepo/repo dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz

