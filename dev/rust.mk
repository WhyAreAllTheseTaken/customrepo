RUSTUP_PACKAGE = rustup_all

$(RUSTUP_PACKAGE): dev/rustup_control
	echo "Packaging $@..."
	mkdir -p $@/DEBIAN
	mkdir -p $@/usr/share/rustup_deb
	wget --show-progress -O $@/usr/share/rustup_deb/rustup_setup.sh https://sh.rustup.rs
	chmod +x $@/usr/share/rustup_deb/rustup_setup.sh
	cp dev/rustup_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp dev/rustup_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm
	cp dev/rustup_control $@/DEBIAN/control

RUST_CHAIN_PACKAGE = rust-toolchain_all

rust-toolchain_all: dev/rust-toolchain_control
	echo "Packaging $@..."
	mkdir -p $@/DEBIAN
	cp dev/rust-toolchain_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp dev/rust-toolchain_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm
	cp dev/rust-toolchain_control $@/DEBIAN/control

RUST_NIGHTLY_PACKAGE = rust-toolchain-nightly_all

rust-toolchain-nightly_all: dev/rust-nightly_control
	echo "Packaging $@..."
	mkdir -p $@/DEBIAN
	cp dev/rust-nightly_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp dev/rust-nightly_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm
	cp dev/rust-nightly_control $@/DEBIAN/control

MIRI_PACKAGE = cargo-miri_all

$(MIRI_PACKAGE): dev/miri_control
	echo "Packaging $@..."
	mkdir -p $@/DEBIAN
	cp dev/miri_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp dev/miri_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm
	cp dev/miri_control $@/DEBIAN/control

