RUSTUP_VERSION = 1.27.1
RUSTUP_REVISION = 9
RUSTUP_PACKAGE = rustup_$(RUSTUP_VERSION)-$(RUSTUP_REVISION)

$(RUSTUP_PACKAGE).deb:
	mkdir -p $(RUSTUP_PACKAGE)/DEBIAN
	mkdir -p $(RUSTUP_PACKAGE)/usr/share/rustup_deb
	mkdir -p $(RUSTUP_PACKAGE)/etc/shadow-maint/useradd-post.d/
	wget --show-progress -O $(RUSTUP_PACKAGE)/usr/share/rustup_deb/rustup_setup.sh https://sh.rustup.rs
	chmod +x $(RUSTUP_PACKAGE)/usr/share/rustup_deb/rustup_setup.sh
	cp rustup_useradd.sh $(RUSTUP_PACKAGE)/etc/shadow-maint/useradd-post.d/rustup.sh
	chmod +x $(RUSTUP_PACKAGE)/etc/shadow-maint/useradd-post.d/rustup.sh
	cp rustup_postinst.sh $(RUSTUP_PACKAGE)/DEBIAN/postinst
	chmod +x $(RUSTUP_PACKAGE)/DEBIAN/postinst
	cp rustup_prerm.sh $(RUSTUP_PACKAGE)/DEBIAN/prerm
	chmod +x $(RUSTUP_PACKAGE)/DEBIAN/prerm
	cp rustup_control $(RUSTUP_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(RUSTUP_PACKAGE)
	rm -rf $(RUSTUP_PACKAGE)

