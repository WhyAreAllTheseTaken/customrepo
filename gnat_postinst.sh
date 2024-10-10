#!/usr/bin/bash

/usr/share/gnat-deb/installer --script /usr/share/gnat-deb/install-script.qs --platform minimal InstallPrefix="/opt/gnat-community"

update-alternatives --install "/usr/bin/gnat" "gnat" "/opt/gnat-community/bin/gnat" 0
update-alternatives --set gnat /opt/gnat-community/bin/gnat

