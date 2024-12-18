WHY_DESKTOP_VERSION = 0.5.0
WHY_DESKTOP_REVISION = 4
WHY_DESKTOP_PACKAGE = why-desktop_$(WHY_DESKTOP_VERSION)-$(WHY_DESKTOP_REVISION)_all

$(REPO)/$(WHY_DESKTOP_PACKAGE).deb:
	echo "Packaging $(WHY_DESKTOP_PACKAGE)..."
	rm -rf $(WHY_DESKTOP_PACKAGE)
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/dunst
	cp whyconfig/home/.config/dunst/dunstrc $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/dunst/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3
	cp whyconfig/home/.config/i3/config $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3blocks
	cp whyconfig/home/.config/i3blocks/i3blocks.conf $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3blocks
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/rofi
	cp whyconfig/home/.config/rofi/config.rasi $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/rofi/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/rofi/themes
	cp whyconfig/home/.config/rofi/themes/Ice.rasi $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/rofi/themes
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/
	cp whyconfig/home/.config/betterlockscreenrc $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/
	cp -r whyconfig/home/.config/picom.conf $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/flameshot
	cp whyconfig/home/.config/flameshot/flameshot.ini $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/flameshot/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/usr/share/backgrounds
	cp whyconfig/usr/share/backgrounds/bg1440.png $(WHY_DESKTOP_PACKAGE)/usr/share/backgrounds
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/lightdm/
	cp whyconfig/etc/lightdm/lightdm-gtk-greeter.conf $(WHY_DESKTOP_PACKAGE)/etc/lightdm/lightdm-gtk-greeter.conf.why
	mkdir -p $(WHY_DESKTOP_PACKAGE)/usr/bin/
	cp ./why-bg.sh $(WHY_DESKTOP_PACKAGE)/usr/bin/why-bg
	chmod +x $(WHY_DESKTOP_PACKAGE)/usr/bin/why-bg
	mkdir -p $(WHY_DESKTOP_PACKAGE)/DEBIAN
	cp why-desktop_control $(WHY_DESKTOP_PACKAGE)/DEBIAN/control
	cp why-desktop_postinst.sh $(WHY_DESKTOP_PACKAGE)/DEBIAN/postinst
	chmod +x $(WHY_DESKTOP_PACKAGE)/DEBIAN/postinst
	cp why-desktop_prerm.sh $(WHY_DESKTOP_PACKAGE)/DEBIAN/prerm
	chmod +x $(WHY_DESKTOP_PACKAGE)/DEBIAN/prerm
	dpkg-deb --build $(WHY_DESKTOP_PACKAGE)
	mv $(WHY_DESKTOP_PACKAGE).deb $(REPO)
	rm -rf $(WHY_DESKTOP_PACKAGE)

WHY_TERM_VERSION = 0.1.0
WHY_TERM_REVISION = 1
WHY_TERM_PACKAGE = why-terminal_$(WHY_TERM_VERSION)-$(WHY_TERM_REVISION)_all

$(REPO)/$(WHY_TERM_PACKAGE).deb:
	echo "Packaging $(WHY_TERM_PACKAGE)..."
	rm -rf $(WHY_TERM_PACKAGE)
	mkdir -p $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/
	cp -r whyconfig/home/.config/kitty/kitty.conf $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/
	cp -r whyconfig/home/.config/kitty/current-theme.conf $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/
	mkdir -p $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/themes/
	cp -r "whyconfig/home/.config/kitty/themes/Ice Tango Dark.conf" $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/themes/
	mkdir -p $(WHY_TERM_PACKAGE)/DEBIAN
	cp why-terminal_control $(WHY_TERM_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_TERM_PACKAGE)
	mv $(WHY_TERM_PACKAGE).deb $(REPO)
	rm -rf $(WHY_TERM_PACKAGE)

WHY_APPS_VERSION = 0.4.0
WHY_APPS_REVISION = 1
WHY_APPS_PACKAGE = why-apps_$(WHY_APPS_VERSION)-$(WHY_APPS_REVISION)_all

$(REPO)/$(WHY_APPS_PACKAGE).deb:
	echo "Packaging $(WHY_APPS_PACKAGE)..."
	rm -rf $(WHY_APPS_PACKAGE)
	mkdir -p $(WHY_APPS_PACKAGE)/DEBIAN
	cp why-apps_control $(WHY_APPS_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_APPS_PACKAGE)
	mv $(WHY_APPS_PACKAGE).deb $(REPO)
	rm -rf $(WHY_APPS_PACKAGE)

