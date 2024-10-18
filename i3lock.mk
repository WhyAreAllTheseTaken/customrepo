I3LOCK_COLOR_VERSION = 2.13.c.5
I3LOCK_COLOR_REVISION = 7
I3LOCK_COLOR_PACKAGE = i3lock-color_$(I3LOCK_COLOR_VERSION)-$(I3LOCK_COLOR_REVISION)

$(REPO)/$(I3LOCK_COLOR_PACKAGE).deb:
	rm -rf i3lock-color
	git clone --depth 1 --branch $(I3LOCK_COLOR_VERSION) https://github.com/Raymo111/i3lock-color.git
	mkdir -p $(I3LOCK_COLOR_PACKAGE)/usr/share/i3lock-color-build
	cp -r i3lock-color/* $(I3LOCK_COLOR_PACKAGE)/usr/share/i3lock-color-build
	mkdir -p $(I3LOCK_COLOR_PACKAGE)/DEBIAN
	cp i3lock-color_control $(I3LOCK_COLOR_PACKAGE)/DEBIAN/control
	cp i3lock-color_postinst.sh $(I3LOCK_COLOR_PACKAGE)/DEBIAN/postinst
	chmod +x $(I3LOCK_COLOR_PACKAGE)/DEBIAN/postinst
	dpkg-deb --build $(I3LOCK_COLOR_PACKAGE)
	mv $(I3LOCK_COLOR_PACKAGE).deb $(REPO)
	rm -rf i3lock-color
	rm -rf $(I3LOCK_COLOR_PACKAGE)

BETTER_LOCK_VERSION = 4.4.0
BETTER_LOCK_REVISION = 2
BETTER_LOCK_PACKAGE = betterlockscreen_$(BETTER_LOCK_VERSION)-$(BETTER_LOCK_REVISION)

$(REPO)/$(BETTER_LOCK_PACKAGE).deb:
	rm -rf betterlockscreen
	git clone --depth 1 --branch v$(BETTER_LOCK_VERSION) https://github.com/betterlockscreen/betterlockscreen.git
	mkdir -p $(BETTER_LOCK_PACKAGE)/usr/bin/
	cp -r betterlockscreen/betterlockscreen $(BETTER_LOCK_PACKAGE)/usr/bin/
	chmod +x $(BETTER_LOCK_PACKAGE)/usr/bin/betterlockscreen
	mkdir -p $(BETTER_LOCK_PACKAGE)/usr/lib/systemd/system
	cp -r betterlockscreen/system/betterlockscreen@.service $(BETTER_LOCK_PACKAGE)/usr/lib/systemd/system/
	mkdir -p $(BETTER_LOCK_PACKAGE)/DEBIAN
	cp betterlock_control $(BETTER_LOCK_PACKAGE)/DEBIAN/control
	cp betterlock_postinst.sh $(BETTER_LOCK_PACKAGE)/DEBIAN/postinst
	chmod +x $(BETTER_LOCK_PACKAGE)/DEBIAN/postinst
	dpkg-deb --build $(BETTER_LOCK_PACKAGE)
	mv $(BETTER_LOCK_PACKAGE).deb $(REPO)
	rm -rf betterlockscreen
	rm -rf $(BETTER_LOCK_PACKAGE)

