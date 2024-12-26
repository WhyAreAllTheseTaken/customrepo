LARAVEL_PACKAGE = laravel-installer_all

laravel-installer_all: dev/laravel_control
	echo "Packaging $@..."
	mkdir -p $@/DEBIAN
	cp dev/laravel_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp dev/laravel_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm
	cp $< $@/DEBIAN/control

