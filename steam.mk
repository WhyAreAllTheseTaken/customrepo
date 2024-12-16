WHY_STEAM_VERSION = 0.0.0
WHY_STEAM_REVISION = 2
WHY_STEAM_PACKAGE = why-steam_$(WHY_STEAM_VERSION)-$(WHY_STEAM_REVISION)_all

$(REPO)/$(WHY_STEAM_PACKAGE).deb:
	echo "Packaging $(WHY_STEAM_PACKAGE)..."
	rm -rf $(WHY_STEAM_PACKAGE)
	mkdir -p $(WHY_STEAM_PACKAGE)/DEBIAN
	cp why-steam_control $(WHY_STEAM_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_STEAM_PACKAGE)
	mv $(WHY_STEAM_PACKAGE).deb $(REPO)
	rm -rf $(WHY_STEAM_PACKAGE)

STEAM_VERSION = 0.0.0
STEAM_REVISION = 1
STEAM_PACKAGE = steam_$(STEAM_VERSION)-$(STEAM_REVISION)_all

$(REPO)/$(STEAM_PACKAGE).deb:
	echo "Downloading $(STEAM_PACKAGE)..."
	wget -O $(REPO)/$(STEAM_PACKAGE).deb https://cdn.fastly.steamstatic.com/client/installer/steam.deb

