GHCUP_VERSION = 0.1.30.0
GHCUP_REVISION = 1
GHCUP_PACKAGE = ghcup_$(GHCUP_VERSION)-$(GHCUP_REVISION)_all

$(REPO)/$(GHCUP_PACKAGE).deb:
	echo "Packaging $(GHCUP_PACKAGE)..."
	mkdir -p $(GHCUP_PACKAGE)/DEBIAN
	mkdir -p $(GHCUP_PACKAGE)/usr/share/ghcup_deb
	wget --show-progress -O $(GHCUP_PACKAGE)/usr/share/ghcup_deb/ghcup_setup.sh https://get-ghcup.haskell.org
	chmod +x $(GHCUP_PACKAGE)/usr/share/ghcup_deb/ghcup_setup.sh
	#mkdir -p $(GHCUP_PACKAGE)/etc/shadow-maint/useradd-post.d/
	#cp ghcup_useradd.sh $(GHCUP_PACKAGE)/etc/shadow-maint/useradd-post.d/ghcup.sh
	#chmod +x $(GHCUP_PACKAGE)/etc/shadow-maint/useradd-post.d/ghcup.sh
	cp ghcup_postinst.sh $(GHCUP_PACKAGE)/DEBIAN/postinst
	chmod +x $(GHCUP_PACKAGE)/DEBIAN/postinst
	cp ghcup_prerm.sh $(GHCUP_PACKAGE)/DEBIAN/prerm
	chmod +x $(GHCUP_PACKAGE)/DEBIAN/prerm
	cp ghcup_control $(GHCUP_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(GHCUP_PACKAGE)
	mv $(GHCUP_PACKAGE).deb $(REPO)
	rm -rf $(GHCUP_PACKAGE)

