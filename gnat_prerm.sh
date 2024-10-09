#!/usr/bin/bash

update-alternatives --remove "gnat" "/opt/gnat-community/bin/gnat"
update-alternatives --remove "gnatstudio" "/opt/gnat-community/bin/gnatstudio"

rm -rf /opt/gnat-community

