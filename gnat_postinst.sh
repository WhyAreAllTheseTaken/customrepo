#!/usr/bin/bash

/usr/share/gnat-deb/installer --script /usr/share/gnat-deb/install-script.qs --platform minimal InstallPrefix="/opt/gnat-community"

update-alternatives --install "/usr/bin/gnat" "gnat" "/usr/share/gnat-deb/gnat" 0
update-alternatives --set gnat /usr/share/gnat-deb/gnat

