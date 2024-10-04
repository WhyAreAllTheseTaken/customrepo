LTSA_VERSION = 3.0
LTSA_REVISION = 2
LTSA_PACKAGE = ltsa_$(LTSA_VERSION)-$(LTSA_REVISION)

$(LTSA_PACKAGE).deb:
	wget --show-progress -O ltsatool.zip https://www.doc.ic.ac.uk/~jnm/book/ltsa/ltsatool.zip
	unzip ltsatool.zip
	mkdir -p $(LTSA_PACKAGE)/usr/share/
	mkdir -p $(LTSA_PACKAGE)/usr/bin/
	cp -rv ./ltsatool $(LTSA_PACKAGE)/usr/share/
	cp ./ltsa $(LTSA_PACKAGE)/usr/bin/
	chmod +x $(LTSA_PACKAGE)/usr/bin/ltsa
	mkdir -p $(LTSA_PACKAGE)/DEBIAN
	cp ltsa_control $(LTSA_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(LTSA_PACKAGE)

