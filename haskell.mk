GHCUP_VERSION = 0.1.20.0
GHCUP_REVISION = 1
GHCUP_PACKAGE = ghcup_$(GHCUP_VERSION)-$(GHCUP_REVISION)

$(GHCUP_PACKAGE).deb:
	mkdir -p $(GHCUP_PACKAGE)/DEBIAN
	mkdir -p $(GHCUP_PACKAGE)/usr/share/ghcup_deb
	wget --show-progress -O $(GHCUP_PACKAGE)/usr/share/ghcup_deb/ghcup_setup.sh https://get-ghcup.haskell.org
	chmod +x $(GHCUP_PACKAGE)/usr/share/ghcup_deb/ghcup_setup.sh
	cp ghcup_postinst.sh $(GHCUP_PACKAGE)/DEBIAN/postinst
	chmod +x $(GHCUP_PACKAGE)/DEBIAN/postinst
	cp ghcup_prerm.sh $(GHCUP_PACKAGE)/DEBIAN/prerm
	chmod +x $(GHCUP_PACKAGE)/DEBIAN/prerm
	cp ghcup_control $(GHCUP_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(GHCUP_PACKAGE)
	rm -rf $(GHCUP_PACKAGE)

