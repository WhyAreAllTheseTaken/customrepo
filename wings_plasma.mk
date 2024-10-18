WINGS_PLASMA_VERSION = 1.0.0
WINGS_PLASMA_REVISION = 1
WINGS_PLASMA_PACKAGE = wings-plasma-themes_$(WINGS_PLASMA_VERSION)-$(WINGS_PLASMA_REVISION)

$(REPO)/$(WINGS_PLASMA_PACKAGE).deb:
	rm -rf ./Wings-Plasma-Themes
	git clone --depth 1 https://github.com/L4ki/Wings-Plasma-Themes.git
	mkdir -p $(WINGS_PLASMA_PACKAGE)/usr/share/icons/
	cp -r ./Wings-Plasma-Themes/Wings\ Icons\ Themes/* $(WINGS_PLASMA_PACKAGE)/usr/share/icons/
	mkdir -p $(WINGS_PLASMA_PACKAGE)/DEBIAN
	cp wings_plasma_control $(WINGS_PLASMA_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WINGS_PLASMA_PACKAGE)
	mv $(WINGS_PLASMA_PACKAGE) $(REPO)
	rm -rf Wings-Plasma-Themes
	rm -rf $(WINGS_PLASMA_PACKAGE)

