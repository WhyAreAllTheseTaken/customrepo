I3LOCK_COLOR_VERSION = 2.13.c.5
I3LOCK_COLOR_REVISION = 2
I3LOCK_COLOR_PACKAGE = i3lock-color_$(I3LOCK_COLOR_VERSION)-$(I3LOCK_COLOR_REVISION)

$(I3LOCK_COLOR_PACKAGE).deb:
	rm -rf nnn
	git clone --depth 1 --branch v$(I3LOCK_COLOR_VERSION) https://github.com/Raymo111/i3lock-color.git
	mkdir -p $(I3LOCK_COLOR_PACKAGE)/etc
	mkdir -p $(I3LOCK_COLOR_PACKAGE)/usr
	cd i3lock-color && autoreconf -fiv
	mkdir -p i3lock-color/build
	cd i3lock-color/build && ../configure --prefix=$(I3LOCK_COLOR_PACKAGE)/usr --sysconfdir=$(I3LOCK_COLOR_PACKAGE)/etc
	cd i3lock-color/build && make
	cd i3lock-color/build && make install
	mkdir -p $(I3LOCK_COLOR_PACKAGE)/DEBIAN
	cp i3lock-color_control $(I3LOCK_COLOR_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(I3LOCK_COLOR_PACKAGE)
	rm -rf nnn
	rm -rf $(I3LOCK_COLOR_PACKAGE)

