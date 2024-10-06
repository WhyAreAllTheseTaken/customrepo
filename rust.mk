RUSTUP_VERSION = 1.27.1
RUSTUP_REVISION = 1
RUSTUP_PACKAGE = rustup_$(RUSTUP_VERSION)-$(RUSTUP_REVISION)

$(RUSTUP_PACKAGE).deb:
	mkdir -p $(RUSTUP_PACKAGE)/DEBIAN
	wget --show-progress -O $(OBSIDIAN_PACKAGE)/DEBIAN/postinst https://sh.rustup.rs
	cp rustup_control $(RUSTUP_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(RUSTUP_PACKAGE)
	rm -rf $(RUSTUP_PACKAGE)

