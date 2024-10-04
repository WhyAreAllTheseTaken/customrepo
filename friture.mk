FRITURE_VERSION = 0.51
FRITURE_REVISION = 6
FRITURE_PACKAGE = friture_$(FRITURE_VERSION)-$(FRITURE_REVISION)

$(FRITURE_PACKAGE).deb:
	rm -rf friture
	git clone --depth 1 --branch v0.51 https://github.com/tlecomte/friture.git
	mkdir -p $(FRITURE_PACKAGE)/usr/share/friture
	cp -rv ./friture/* $(FRITURE_PACKAGE)/usr/share/friture
	cp friture_requirements.txt $(FRITURE_PACKAGE)/usr/share/friture/requirements.txt
	mkdir -p $(FRITURE_PACKAGE)/usr/bin/
	cp friture.sh $(FRITURE_PACKAGE)/usr/bin/friture
	chmod +x $(FRITURE_PACKAGE)/usr/bin/friture
	mkdir -p $(FRITURE_PACKAGE)/DEBIAN
	cp friture_control $(FRITURE_PACKAGE)/DEBIAN/control
	cp friture_postinst.sh $(FRITURE_PACKAGE)/DEBIAN/postinst
	chmod +x $(FRITURE_PACKAGE)/DEBIAN/postinst
	dpkg-deb --build $(FRITURE_PACKAGE)
	rm -rf friture
	rm -rf $(FRITURE_PACKAGE)


