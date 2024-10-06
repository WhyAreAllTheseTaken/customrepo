WHY_NNN_VERSION = 0.0.0
WHY_NNN_REVISION = 1
WHY_NNN_PACKAGE = why-nnn_$(WHY_NNN_VERSION)-$(WHY_NNN_REVISION)

$(WHY_NNN_PACKAGE).deb:
	rm -rfv $(WHY_NNN_PACKAGE)
	mkdir -p $(WHY_NNN_PACKAGE)/usr/bin/
	cp ./start_nnn.sh $(WHY_NNN_PACKAGE)/usr/bin/start_nnn
	chmod +x $(WHY_NNN_PACKAGE)/usr/bin/start_nnn
	mkdir -p $(WHY_NNN_PACKAGE)/DEBIAN
	cp why-nnn_control $(WHY_NNN_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_NNN_PACKAGE)
	rm -rf $(WHY_NNN_PACKAGE)

