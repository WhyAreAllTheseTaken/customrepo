WHY_DESKTOP_VERSION = 0.1.0
WHY_DESKTOP_REVISION = 1
WHY_DESKTOP_PACKAGE = why-desktop_$(WHY_DESKTOP_VERSION)-$(WHY_DESKTOP_REVISION)

$(WHY_DESKTOP_PACKAGE).deb:
	rm -rfv $(WHY_DESKTOP_PACKAGE)
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/dunst
	cp -r whyconfig/home/.config/dunst/dunstrc $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/dunst/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3
	cp -r whyconfig/home/.config/i3/config $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3blocks
	cp -r whyconfig/home/.config/i3blocks/i3blocks.conf $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3blocks
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/rofi
	cp -r whyconfig/home/.config/rofi/config.rasi $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/rofi/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/rofi/themes
	cp -r whyconfig/home/.config/rofi/themes/Ice.rasi $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/rofi/themes
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/
	cp -r whyconfig/home/.config/betterlockscreenrc $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/
	cp -r whyconfig/home/.config/picom.conf $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/flameshot
	cp -r whyconfig/home/.config/flameshot/flameshot.ini $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/flameshot/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/DEBIAN
	cp why-desktop_control $(WHY_DESKTOP_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_DESKTOP_PACKAGE)
	rm -rf $(WHY_DESKTOP_PACKAGE)
