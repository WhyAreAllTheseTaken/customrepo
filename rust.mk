RUSTUP_VERSION = 1.27.1
RUSTUP_REVISION = 13
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
RUST_CHAIN_REVISION = 5
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

RUST_NIGHTLY_VERSION = 1.85.0
RUST_NIGHTLY_REVISION = 2
RUST_NIGHTLY_DATE = 20241127
RUST_NIGHTLY_HASH = 6b6a867ae
RUST_NIGHTLY_PACKAGE = rust-toolchain-nightly_$(RUST_NIGHTLY_VERSION)+git$(RUST_NIGHTLY_DATE)$(RUST_NIGHTLY_HASH)-$(RUST_NIGHTLY_REVISION)

$(REPO)/$(RUST_NIGHTLY_PACKAGE).deb:
	echo "Packaging $(RUST_NIGHTLY_PACKAGE)..."
	mkdir -p $(RUST_NIGHTLY_PACKAGE)/DEBIAN
	mkdir -p $(RUST_NIGHTLY_PACKAGE)/etc/shadow-maint/useradd-post.d/
	cp rust-nightly_useradd.sh $(RUST_NIGHTLY_PACKAGE)/etc/shadow-maint/useradd-post.d/rust-nightly.sh
	chmod +x $(RUST_NIGHTLY_PACKAGE)/etc/shadow-maint/useradd-post.d/rust-nightly.sh
	cp rust-nightly_postinst.sh $(RUST_NIGHTLY_PACKAGE)/DEBIAN/postinst
	chmod +x $(RUST_NIGHTLY_PACKAGE)/DEBIAN/postinst
	cp rust-nightly_prerm.sh $(RUST_NIGHTLY_PACKAGE)/DEBIAN/prerm
	chmod +x $(RUST_NIGHTLY_PACKAGE)/DEBIAN/prerm
	cp rust-nightly_control $(RUST_NIGHTLY_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(RUST_NIGHTLY_PACKAGE)
	mv $(RUST_NIGHTLY_PACKAGE).deb $(REPO)
	rm -rf $(RUST_NIGHTLY_PACKAGE)

MIRI_VERSION = 0.1.0
MIRI_REVISION = 2
MIRI_DATE = 20241127
MIRI_HASH = 6b6a867ae
MIRI_PACKAGE = cargo-miri_$(MIRI_VERSION)+git$(MIRI_DATE)$(MIRI_HASH)-$(MIRI_REVISION)

$(REPO)/$(MIRI_PACKAGE).deb:
	echo "Packaging $(MIRI_PACKAGE)..."
	mkdir -p $(MIRI_PACKAGE)/DEBIAN
	mkdir -p $(MIRI_PACKAGE)/etc/shadow-maint/useradd-post.d/
	cp miri_useradd.sh $(MIRI_PACKAGE)/etc/shadow-maint/useradd-post.d/miri.sh
	chmod +x $(MIRI_PACKAGE)/etc/shadow-maint/useradd-post.d/miri.sh
	cp miri_postinst.sh $(MIRI_PACKAGE)/DEBIAN/postinst
	chmod +x $(MIRI_PACKAGE)/DEBIAN/postinst
	cp miri_prerm.sh $(MIRI_PACKAGE)/DEBIAN/prerm
	chmod +x $(MIRI_PACKAGE)/DEBIAN/prerm
	cp miri_control $(MIRI_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(MIRI_PACKAGE)
	mv $(MIRI_PACKAGE).deb $(REPO)
	rm -rf $(MIRI_PACKAGE)



