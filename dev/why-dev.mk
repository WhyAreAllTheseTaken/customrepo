WHY_DEV_PACKAGE = why-dev_all

why-dev_all: dev/why-dev_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

why-dev-%_all: dev/why-dev-%_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

why-dev-base_all: dev/why-dev-base_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp dev/why-dev-base_control $@/DEBIAN/control
	cp dev/why-dev-base_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp dev/why-dev-base_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm

WHY_DEV_BASE_PACKAGE = why-dev-base_all
WHY_DEV_ADA_PACKAGE = why-dev-ada_all
WHY_DEV_HASKELL_PACKAGE = why-dev-haskell_all
WHY_DEV_JAVA_PACKAGE = why-dev-java_all
WHY_DEV_MINECRAFT_PACKAGE = why-dev-minecraft_all
WHY_DEV_ML_PACKAGE = why-dev-ml_all
WHY_DEV_ML_NVIDIA_PACKAGE = why-dev-ml-nvidia_all
WHY_DEV_NET_PACKAGE = why-dev-net_all
WHY_DEV_PHP_PACKAGE = why-dev-php_all
WHY_DEV_PROLOG_PACKAGE = why-dev-prolog_all
WHY_DEV_RUST_PACKAGE = why-dev-rust_all
WHY_DEV_UNITY_PACKAGE = why-dev-unity_all
WHY_DEV_REPO_PACKAGE = why-dev-repo_all
WHY_DEV_GFX_PACKAGE = why-dev-gfx_all

