RUSTUP_VERSION = 1.27.1
RUSTUP_REVISION = 1
RUSTUP_PACKAGE = rustup_$(RUSTUP_VERSION)-$(RUSTUP_REVISION)

$(RUSTUP_PACKAGE).deb:
	mkdir -p $(RUSTUP_PACKAGE)/DEBIAN
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -O $(RUSTUP_PACKAGE)/DEBIAN/postinst
	cp rustup_control $(RUSTUP_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(RUSTUP_PACKAGE)
	rm -rf $(RUSTUP_PACKAGE)

