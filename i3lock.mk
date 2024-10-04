I3LOCK_COLOR_VERSION = 2.13.c.5
I3LOCK_COLOR_REVISION = 5
I3LOCK_COLOR_PACKAGE = i3lock-color_$(I3LOCK_COLOR_VERSION)-$(I3LOCK_COLOR_REVISION)

$(I3LOCK_COLOR_PACKAGE).deb:
	rm -rf i3lock-color
	git clone --depth 1 --branch $(I3LOCK_COLOR_VERSION) https://github.com/Raymo111/i3lock-color.git
	cd i3lock-color && autoreconf -fiv
	mkdir -p i3lock-color/build
	cd i3lock-color/build && ../configure --prefix=/usr --sysconfdir=/etc
	cd i3lock-color/build && make
	mkdir -p $(I3LOCK_COLOR_PACKAGE)/usr/share/i3lock-color-build
	cp i3lock-color/* $(I3LOCK_COLOR_PACKAGE)/usr/share/i3lock-color-build
	mkdir -p $(I3LOCK_COLOR_PACKAGE)/DEBIAN
	cp i3lock-color_control $(I3LOCK_COLOR_PACKAGE)/DEBIAN/control
	cp i3lock-color_postinst.sh $(I3LOCK_COLOR_PACKAGE)/DEBIAN/postinst
	chmod +x $(I3LOCK_COLOR_PACKAGE)/DEBIAN/postinst
	dpkg-deb --build $(I3LOCK_COLOR_PACKAGE)
	rm -rf i3lock-color
	rm -rf $(I3LOCK_COLOR_PACKAGE)

