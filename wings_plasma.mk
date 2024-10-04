WINGS_PLASMA_VERSION = 0.0.0
WINGS_PLASMA_REVISION = 1
WINGS_PLASMA_PACKAGE = wings-plasma-themes_$(WINGS_PLASMA_VERSION)-$(WINGS_PLASMA_REVISION)

$(WINGS_PLASMA_PACKAGE).deb:
	rm -rfv ./Wings-Plasma-Themes
	git clone --depth 1 https://github.com/L4ki/Wings-Plasma-Themes.
	mkdir -p $(WINGS_PLASMA_PACKAGE)/usr/share/icons/
	cp -rv ./Wings-Plasma-Themes/Wings\ Icons\ Themes/* $(WINGS_PLASMA_PACKAGE)/usr/share/icons/
	mkdir -p $(WINGS_PLASMA_PACKAGE)/usr/share/backgrounds/
	cp -rv ./Wings-Plasma-Themes/Wings\ Wallpapers/* $(WINGS_PLASMA_PACKAGE)/usr/share/backgrounds/
	mkdir -p $(WINGS_PLASMA_PACKAGE)/DEBIAN
	cp wings_plasma_control $(WINGS_PLASMA_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WINGS_PLASMA_PACKAGE)

