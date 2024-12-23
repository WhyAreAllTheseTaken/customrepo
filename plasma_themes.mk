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

$(REPO)/$(WINGS_WALLPAPER_PACKAGE).deb:
	echo "Packaging $(WINGS_WALLPAPER_PACKAGE)..."
	rm -rf ./Wings-Plasma-Themes
	git clone --depth 1 https://github.com/L4ki/Wings-Plasma-Themes.git
	mkdir -p $(WINGS_WALLPAPER_PACKAGE)/usr/share/backgrounds/
	cp -r ./Wings-Plasma-Themes/Wings\ Wallpapers/* $(WINGS_WALLPAPER_PACKAGE)/usr/share/backgrounds/
	mkdir -p $(WINGS_WALLPAPER_PACKAGE)/DEBIAN
	cp wings-plasma-wallpapers_control $(WINGS_WALLPAPER_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WINGS_WALLPAPER_PACKAGE)
	mv $(WINGS_WALLPAPER_PACKAGE).deb $(REPO)
	rm -rf Wings-Plasma-Themes
	rm -rf $(WINGS_WALLPAPER_PACKAGE)

%-plasma-theme: %_version
	rm -rf ./%-plasma-theme
	rm -rf ./%-Plasma-Themes
	git clone --depth 1 https://github.com/L4ki/%-Plasma-Themes.git
	mkdir -p $@/usr/share/plasma/desktoptheme/
	cp -r ./%-Plasma-Themes/%\ Plasma\ Themes/* $@/usr/share/plasma/desktoptheme/
	cp -r ./%-Plasma-Themes/%\ Global\ Themes/* $@/usr/share/plasma/desktoptheme/
	mkdir -p $@/usr/share/plasma/look-and-feel/
	cp -r ./%-Plasma-Themes/%\ Splshscreens/* $@/usr/share/plasma/look-and-feel/
	mkdir -p $@/usr/share/sddm/themes/
	cp -r ./%-Plasma-Themes/%\ SDDM\ Themes/* $@/usr/share/sddm/themes/
	mkdir -p $@/usr/share/aurorae/themes/
	cp -r ./%-Plasma-Themes/%\ Window\ Decorations/* $@/usr/share/aurorae/themes/
	mkdir -p $@/usr/share/color-schemes/
	cp -r ./%-Plasma-Themes/%\ Color\ Schemes/* $@/usr/share/color-schemes/
	mkdir -p $@/DEBIAN
	cp plasma-theme_control $@/DEBIAN/control
	sed -i "s/%package%/\l%/g" $@/DEBIAN/control
	sed -i "s/%name%/%/g" $@/DEBIAN/control
	sed -i "s/%version%/$(cat %-plasma_version)/g" $@/DEBIAN/control
	rm -rf %-Plasma-Themes

$(REPO)/%-plasma-theme.deb: %-plasma-theme
	dpkg-deb --build $<
	mv $<.deb $(REPO)

%-gtk-theme: %_version
	rm -rf ./%-gtk-theme
	rm -rf ./%-Plasma-Themes
	git clone --depth 1 https://github.com/L4ki/%-Plasma-Themes.git
	mkdir -p $@/usr/share/themes/
	cp -r ./%-Plasma-Themes/%\ GTK\ Themes/* $@/usr/share/themes/
	mkdir -p $@/DEBIAN
	cp gtk-theme_control $@/DEBIAN/control
	sed -i "s/%package%/\l%/g" $@/DEBIAN/control
	sed -i "s/%name%/%/g" $@/DEBIAN/control
	sed -i "s/%version%/$(cat %_version)/g" $@/DEBIAN/control
	rm -rf %-Plasma-Themes

$(REPO)/%-gtk-theme.deb: %-gtk-theme
	dpkg-deb --build $<
	mv $<.deb $(REPO)

%-icon-theme: %_version
	rm -rf ./%-icon-theme
	rm -rf ./%-Plasma-Themes
	git clone --depth 1 https://github.com/L4ki/%-Plasma-Themes.git
	mkdir -p $@/usr/share/icons/
	cp -r ./%-Plasma-Themes/%\ Icon\ Themes/* $@/usr/share/icons/
	mkdir -p $@/DEBIAN
	cp icon-theme_control $@/DEBIAN/control
	sed -i "s/%package%/\l%/g" $@/DEBIAN/control
	sed -i "s/%name%/%/g" $@/DEBIAN/control
	sed -i "s/%version%/$(cat %_version)/g" $@/DEBIAN/control
	rm -rf %-Plasma-Themes

$(REPO)/%-icon-theme.deb: %-icon-theme
	dpkg-deb --build $<
	mv $<.deb $(REPO)

%-wallpapers: %_version
	rm -rf ./%-wallpapers
	rm -rf ./%-Plasma-Themes
	git clone --depth 1 https://github.com/L4ki/%-Plasma-Themes.git
	mkdir -p $@/usr/share/backgrounds/
	cp -r ./%-Plasma-Themes/%\ Wallpapers/* $@/usr/share/icons/
	mkdir -p $@/DEBIAN
	cp wallpaper_control $@/DEBIAN/control
	sed -i "s/%package%/\l%/g" $@/DEBIAN/control
	sed -i "s/%name%/%/g" $@/DEBIAN/control
	sed -i "s/%version%/$(cat %_version)/g" $@/DEBIAN/control
	rm -rf %-Plasma-Themes

$(REPO)/%-wallpapers.deb: %-icon-theme
	dpkg-deb --build $<
	mv $<.deb $(REPO)

%_themes: $(REPO)/%-plasma-theme.deb $(REPO)/%-icon-theme.deb $(REPO)/%-wallpapers.deb $(REPO)/%-gtk-theme.deb

plasma_theme_set: Infinity_themes
