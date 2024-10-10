GNAT_VERSION = 2021.20210519
GNAT_REVISION = 5
GNAT_PACKAGE = gnat-community_$(GNAT_VERSION)-$(GNAT_REVISION)

gnat-community-installer_$(GNAT_VERSION):
	wget -O gnat-community-installer_$(GNAT_VERSION) "https://community.download.adacore.com/v1/f3a99d283f7b3d07293b2e1d07de00e31e332325?filename=gnat-2021-20210519-x86_64-linux-bin&rand=1826"

$(GNAT_PACKAGE).deb: gnat-community-installer_$(GNAT_VERSION)
	rm -rf $(GNAT_PACKAGE)
	mkdir -p $(GNAT_PACKAGE)/usr/share/gnat-deb/
	cp gnat-community-installer_$(GNAT_VERSION) $(GNAT_PACKAGE)/usr/share/gnat-deb/installer
	chmod +x $(GNAT_PACKAGE)/usr/share/gnat-deb/installer
	wget -O $(GNAT_PACKAGE)/usr/share/gnat-deb/install-script.qs "https://raw.githubusercontent.com/AdaCore/gnat_community_install_script/refs/heads/master/install_script.qs"
	chmod +x $(GNAT_PACKAGE)/usr/share/gnat-deb/install-script.qs
	mkdir -p $(GNAT_PACKAGE)/usr/bin/
	cp gnatstudio.sh $(GNAT_PACKAGE)/usr/bin/gnatstudio
	chmod +x $(GNAT_PACKAGE)/usr/bin/gnatstudio
	mkdir -p $(GNAT_PACKAGE)/DEBIAN
	cp gnat_control $(GNAT_PACKAGE)/DEBIAN/control
	cp gnat_postinst.sh $(GNAT_PACKAGE)/DEBIAN/postinst
	chmod +x $(GNAT_PACKAGE)/DEBIAN/postinst
	cp gnat_prerm.sh $(GNAT_PACKAGE)/DEBIAN/prerm
	chmod +x $(GNAT_PACKAGE)/DEBIAN/prerm
	dpkg-deb --build $(GNAT_PACKAGE)
	rm -rf $(GNAT_PACKAGE)

