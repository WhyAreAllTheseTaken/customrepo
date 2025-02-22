#!/usr/bin/bash

ARCH=$(dpkg --print-architecture)

echo "Getting the latest build instructions..."
cd /usr/customrepo && sudo -u customrepo -- git pull origin master
echo "Checking self-update..."
cd /usr/customrepo && sudo -u customrepo -- make -s build
echo "Updating self..."
cd /usr/customrepo && make install
echo "Repulling instructions..."
cd /usr/customrepo && sudo -u customrepo -- git pull origin master
echo "Building packages..."
cd /usr/customrepo && sudo -u customrepo -- make -s --keep-going packages
echo "Updating repository. This may take some time..."
cd /usr/customrepo/repo && sudo -u customrepo -- dpkg-scanpackages -m -a $ARCH . /dev/null | gzip -9c > Packages.gz
echo "Custom repository has been updated. Run apt update to check for package updates."

