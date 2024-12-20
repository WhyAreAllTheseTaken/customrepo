WHY_STEAM_VERSION = 0.0.0
WHY_STEAM_REVISION = 6
WHY_STEAM_PACKAGE = why-steam_$(WHY_STEAM_VERSION)-$(WHY_STEAM_REVISION)_amd64

$(REPO)/$(WHY_STEAM_PACKAGE).deb:
	echo "Packaging $(WHY_STEAM_PACKAGE)..."
	rm -rf $(WHY_STEAM_PACKAGE)
	mkdir -p $(WHY_STEAM_PACKAGE)/DEBIAN
	cp why-steam_control $(WHY_STEAM_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_STEAM_PACKAGE)
	mv $(WHY_STEAM_PACKAGE).deb $(REPO)
	rm -rf $(WHY_STEAM_PACKAGE)

STEAM_VERSION = 1.0.0.81
STEAM_PACKAGE = steam_$(STEAM_VERSION)_amd64

$(REPO)/$(STEAM_PACKAGE).deb:
	echo "Downloading $(STEAM_PACKAGE)..."
	wget -O $(REPO)/$(STEAM_PACKAGE).deb https://cdn.fastly.steamstatic.com/client/installer/steam.deb

