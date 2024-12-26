WHY_STEAM_PACKAGE = why-steam_amd64

why-steam_amd64: why-steam_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

STEAM_VERSION = 1.0.0.81
STEAM_PACKAGE = steam_$(STEAM_VERSION)_amd64

$(REPO)/$(STEAM_PACKAGE).deb:
	echo "Downloading $(STEAM_PACKAGE)..."
	wget -O $(REPO)/$(STEAM_PACKAGE).deb https://cdn.fastly.steamstatic.com/client/installer/steam.deb

