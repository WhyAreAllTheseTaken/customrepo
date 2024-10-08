#!/usr/bin/bash

echo "Getting the latest build instructions..."
cd /usr/customrepo && sudo -u customrepo -- git pull origin master
echo "Checking self-update..."
cd /usr/customrepo && sudo -u customrepo -- make -s --debug=b build
echo "Building packages..."
cd /usr/customrepo && sudo -u customrepo -- make -s --debug=b --keep-going packages
echo "Updating repository. This may take some time..."
cd /usr/customrepo && sudo -u customrepo -- dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz
echo "Custom repository has been updated. Run apt update to check for package updates."

