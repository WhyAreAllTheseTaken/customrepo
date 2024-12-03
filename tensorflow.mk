TENSORFLOW_VERSION = 0.1.0
TENSORFLOW_REVISION = 3
TENSORFLOW_PACKAGE = cargo-miri_$(TENSORFLOW_VERSION)-$(TENSORFLOW_REVISION)

$(REPO)/$(TENSORFLOW_PACKAGE).deb:
	echo "Packaging $(TENSORFLOW_PACKAGE)..."
	mkdir -p $(TENSORFLOW_PACKAGE)/DEBIAN
	cp tensorflow_postinst.sh $(TENSORFLOW_PACKAGE)/DEBIAN/postinst
	chmod +x $(TENSORFLOW_PACKAGE)/DEBIAN/postinst
	cp tensorflow_prerm.sh $(TENSORFLOW_PACKAGE)/DEBIAN/prerm
	chmod +x $(TENSORFLOW_PACKAGE)/DEBIAN/prerm
	cp tensorflow_control $(TENSORFLOW_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(TENSORFLOW_PACKAGE)
	mv $(TENSORFLOW_PACKAGE).deb $(REPO)
	rm -rf $(TENSORFLOW_PACKAGE)

