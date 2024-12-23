WINGS_PLASMA_VERSION = 1.0.0
WINGS_PLASMA_REVISION = 3
WINGS_PLASMA_PACKAGE = wings-plasma-theme_$(WINGS_PLASMA_VERSION)-$(WINGS_PLASMA_REVISION)_all

$(REPO)/$(WINGS_PLASMA_PACKAGE).deb:
	echo "Packaging $(WINGS_PLASMA_PACKAGE)..."
	rm -rf ./Wings-Plasma-Themes
	git clone --depth 1 https://github.com/L4ki/Wings-Plasma-Themes.git
	mkdir -p $(WINGS_PLASMA_PACKAGE)/usr/share/plasma/desktoptheme/
	cp -r ./Wings-Plasma-Themes/Wings\ Plasma\ Themes/* $(WINGS_PLASMA_PACKAGE)/usr/share/plasma/desktoptheme/
	cp -r ./Wings-Plasma-Themes/Wings\ Global\ Themes/* $(WINGS_PLASMA_PACKAGE)/usr/share/plasma/desktoptheme/
	mkdir -p $(WINGS_PLASMA_PACKAGE)/usr/share/plasma/look-and-feel/
	cp -r ./Wings-Plasma-Themes/Wings\ Splshscreens/* $(WINGS_PLASMA_PACKAGE)/usr/share/plasma/look-and-feel/
	mkdir -p $(WINGS_PLASMA_PACKAGE)/usr/share/sddm/themes/
	cp -r ./Wings-Plasma-Themes/Wings\ SDDM\ Themes/* $(WINGS_PLASMA_PACKAGE)/usr/share/sddm/themes/
	mkdir -p $(WINGS_PLASMA_PACKAGE)/usr/share/aurorae/themes/
	cp -r ./Wings-Plasma-Themes/Wings\ Window\ Decorations/* $(WINGS_PLASMA_PACKAGE)/usr/share/aurorae/themes/
	mkdir -p $(WINGS_PLASMA_PACKAGE)/usr/share/color-schemes/
	cp -r ./Wings-Plasma-Themes/Wings\ Color\ Schemes/* $(WINGS_PLASMA_PACKAGE)/usr/share/color-schemes/
	mkdir -p $(WINGS_PLASMA_PACKAGE)/DEBIAN
	cp wings-plasma_control $(WINGS_PLASMA_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WINGS_PLASMA_PACKAGE)
	mv $(WINGS_PLASMA_PACKAGE).deb $(REPO)
	rm -rf Wings-Plasma-Themes
	rm -rf $(WINGS_PLASMA_PACKAGE)

WINGS_ICON_VERSION = 1.0.0
WINGS_ICON_REVISION = 3
WINGS_ICON_PACKAGE = wings-plasma-icon-theme_$(WINGS_ICON_VERSION)-$(WINGS_ICON_REVISION)_all

$(REPO)/$(WINGS_ICON_PACKAGE).deb:
	echo "Packaging $(WINGS_ICON_PACKAGE)..."
	rm -rf ./Wings-Plasma-Themes
	git clone --depth 1 https://github.com/L4ki/Wings-Plasma-Themes.git
	mkdir -p $(WINGS_ICON_PACKAGE)/usr/share/icons/
	cp -r ./Wings-Plasma-Themes/Wings\ Icons\ Themes/* $(WINGS_ICON_PACKAGE)/usr/share/icons/
	mkdir -p $(WINGS_ICON_PACKAGE)/DEBIAN
	cp wings-plasma-icon_control $(WINGS_ICON_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WINGS_ICON_PACKAGE)
	mv $(WINGS_ICON_PACKAGE).deb $(REPO)
	rm -rf Wings-Plasma-Themes
	rm -rf $(WINGS_ICON_PACKAGE)

WINGS_WALLPAPER_VERSION = 1.0.0
WINGS_WALLPAPER_REVISION = 3
WINGS_WALLPAPER_PACKAGE = wings-plasma-wallpapers_$(WINGS_WALLPAPER_VERSION)-$(WINGS_WALLPAPER_REVISION)_all

$(REPO)/$(WINGS_WALLPAPER_PACKAGE).deb: $(REPO)/$(WINGS_ICON_PACKAGE).deb
	echo "Packaging $(WINGS_WALLPAPER_PACKAGE)..."
	rm -rf ./Wings-Plasma-Themes
	git clone --depth 1 https://github.com/L4ki/Wings-Plasma-Themes.git
	mkdir -p $(WINGS_WALLPAPER_PACKAGE)/usr/share/backgrounds/
	cp -r ./Wings-Plasma-Themes/Wings\ Wallpapers/* $(WINGS_WALLPAPER_PACKAGE)/usr/share/backgrounds/
	mkdir -p $(WINGS_WALLPAPER_PACKAGE)/DEBIAN
	cp wings-plasma-wallpapers-control $(WINGS_WALLPAPER_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WINGS_WALLPAPER_PACKAGE)
	mv $(WINGS_WALLPAPER_PACKAGE).deb $(REPO)
	rm -rf Wings-Plasma-Themes
	rm -rf $(WINGS_WALLPAPER_PACKAGE)

