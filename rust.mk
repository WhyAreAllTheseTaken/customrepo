RUSTUP_VERSION = 1.27.1
RUSTUP_REVISION = 12
RUSTUP_PACKAGE = rustup_$(RUSTUP_VERSION)-$(RUSTUP_REVISION)

$(REPO)/$(RUSTUP_PACKAGE).deb:
	echo "Packaging $(RUSTUP_PACKAGE)..."
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
	mv $(RUSTUP_PACKAGE).deb $(REPO)
	rm -rf $(RUSTUP_PACKAGE)

RUST_CHAIN_VERSION = 1.83.0
RUST_CHAIN_REVISION = 2
RUST_CHAIN_PACKAGE = rust-toolchain_$(RUST_CHAIN_VERSION)-$(RUST_CHAIN_REVISION)

$(REPO)/$(RUST_CHAIN_PACKAGE).deb:
	echo "Packaging $(RUST_CHAIN_PACKAGE)..."
	mkdir -p $(RUST_CHAIN_PACKAGE)/DEBIAN
	mkdir -p $(RUST_CHAIN_PACKAGE)/etc/shadow-maint/useradd-post.d/
	cp rust-toolchain_useradd.sh $(RUST_CHAIN_PACKAGE)/etc/shadow-maint/useradd-post.d/rust-toolchain.sh
	chmod +x $(RUST_CHAIN_PACKAGE)/etc/shadow-maint/useradd-post.d/rust-toolchain.sh
	cp rust-toolchain_postinst.sh $(RUST_CHAIN_PACKAGE)/DEBIAN/postinst
	chmod +x $(RUST_CHAIN_PACKAGE)/DEBIAN/postinst
	cp rust-toolchain_prerm.sh $(RUST_CHAIN_PACKAGE)/DEBIAN/prerm
	chmod +x $(RUST_CHAIN_PACKAGE)/DEBIAN/prerm
	cp rust-toolchain_control $(RUST_CHAIN_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(RUST_CHAIN_PACKAGE)
	mv $(RUST_CHAIN_PACKAGE).deb $(REPO)
	rm -rf $(RUST_CHAIN_PACKAGE)

