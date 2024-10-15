LARAVEL_VERSION = 5.9.0
LARAVEL_REVISION = 3
LARAVEL_PACKAGE = laravel-installer_$(LARAVEL_VERSION)-$(LARAVEL_REVISION)

$(LARAVEL_PACKAGE).deb:
	mkdir -p $(LARAVEL_PACKAGE)/DEBIAN
	cp laravel_postinst.sh $(LARAVEL_PACKAGE)/DEBIAN/postinst
	chmod +x $(LARAVEL_PACKAGE)/DEBIAN/postinst
	cp laravel_prerm.sh $(LARAVEL_PACKAGE)/DEBIAN/prerm
	chmod +x $(LARAVEL_PACKAGE)/DEBIAN/prerm
	cp laravel_control $(LARAVEL_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(LARAVEL_PACKAGE)
	rm -rf $(LARAVEL_PACKAGE)


