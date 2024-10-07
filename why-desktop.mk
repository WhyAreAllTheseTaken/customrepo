WHY_DESKTOP_VERSION = 0.3.0
WHY_DESKTOP_REVISION = 2
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
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/lightdm/
	cp -r whyconfig/etc/lightdm/lightdm-gtk-greeter.conf $(WHY_DESKTOP_PACKAGE)/etc/lightdm/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/DEBIAN
	cp why-desktop_control $(WHY_DESKTOP_PACKAGE)/DEBIAN/control
	cp why-desktop_preinst.sh $(WHY_DESKTOP_PACKAGE)/DEBIAN/preinst
	chmod +x $(WHY_DESKTOP_PACKAGE)/DEBIAN/preinst
	cp why-desktop_postrm.sh $(WHY_DESKTOP_PACKAGE)/DEBIAN/postrm
	chmod +x $(WHY_DESKTOP_PACKAGE)/DEBIAN/postrm
	dpkg-deb --build $(WHY_DESKTOP_PACKAGE)
	rm -rf $(WHY_DESKTOP_PACKAGE)

WHY_TERM_VERSION = 0.1.0
WHY_TERM_REVISION = 1
WHY_TERM_PACKAGE = why-terminal_$(WHY_TERM_VERSION)-$(WHY_TERM_REVISION)

$(WHY_TERM_PACKAGE).deb:
	rm -rfv $(WHY_TERM_PACKAGE)
	mkdir -p $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/
	cp -r whyconfig/home/.config/kitty/kitty.conf $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/
	cp -r whyconfig/home/.config/kitty/current-theme.conf $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/
	mkdir -p $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/themes/
	cp -r "whyconfig/home/.config/kitty/themes/Ice Tango Dark.conf" $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/themes/
	mkdir -p $(WHY_TERM_PACKAGE)/DEBIAN
	cp why-terminal_control $(WHY_TERM_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_TERM_PACKAGE)
	rm -rf $(WHY_TERM_PACKAGE)

WHY_APPS_VERSION = 0.1.0
WHY_APPS_REVISION = 2
WHY_APPS_PACKAGE = why-apps_$(WHY_APPS_VERSION)-$(WHY_APPS_REVISION)

$(WHY_APPS_PACKAGE).deb:
	rm -rfv $(WHY_APPS_PACKAGE)
	mkdir -p $(WHY_APPS_PACKAGE)/DEBIAN
	cp why-apps_control $(WHY_APPS_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_APPS_PACKAGE)
	rm -rf $(WHY_APPS_PACKAGE)

