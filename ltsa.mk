LTSA_VERSION = 3.0
LTSA_REVISION = 5
LTSA_PACKAGE = ltsa_$(LTSA_VERSION)-$(LTSA_REVISION)_all

$(REPO)/$(LTSA_PACKAGE).deb:
	echo "Packaging $(LTSA_PACKAGE)..."
	wget --show-progress -O ltsatool.zip https://www.doc.ic.ac.uk/~jnm/book/ltsa/ltsatool.zip
	rm -rf ltsatool
	unzip ltsatool.zip
	mkdir -p $(LTSA_PACKAGE)/usr/share/
	mkdir -p $(LTSA_PACKAGE)/usr/bin/
	cp -r ./ltsatool $(LTSA_PACKAGE)/usr/share/
	cp ./ltsa $(LTSA_PACKAGE)/usr/bin/
	chmod +x $(LTSA_PACKAGE)/usr/bin/ltsa
	mkdir -p $(LTSA_PACKAGE)/DEBIAN
	cp ltsa_control $(LTSA_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(LTSA_PACKAGE)
	mv $(LTSA_PACKAGE).deb $(REPO)
	rm -rf ltsatool
	rm -rf $(LTSA_PACKAGE)

