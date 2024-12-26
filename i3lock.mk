I3LOCK_COLOR_PACKAGE = i3lock-color_amd64

$(I3LOCK_COLOR_PACKAGE): i3lock-color_control
	echo "Packaging $@..."
	rm -rf $@
	rm -rf i3lock-color
	git clone --depth 1 --branch 2.13.c.5 https://github.com/Raymo111/i3lock-color.git
	mkdir -p $@/usr/share/i3lock-color-build
	cp -r i3lock-color/* $@/usr/share/i3lock-color-build
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control
	cp i3lock-color_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	rm -rf i3lock-color

BETTER_LOCK_VERSION = 4.4.0
BETTER_LOCK_PACKAGE = betterlockscreen_amd64

$(BETTER_LOCK_PACKAGE): betterlock_control
	echo "Packaging $@..."
	rm -rf $@
	rm -rf betterlockscreen
	git clone --depth 1 --branch v$(BETTER_LOCK_VERSION) https://github.com/betterlockscreen/betterlockscreen.git
	mkdir -p $@/usr/bin/
	cp -r betterlockscreen/betterlockscreen $@/usr/bin/
	chmod +x $@/usr/bin/betterlockscreen
	mkdir -p $@/usr/lib/systemd/system
	cp -r betterlockscreen/system/betterlockscreen@.service $@/usr/lib/systemd/system/
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control
	cp betterlock_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	rm -rf betterlockscreen

