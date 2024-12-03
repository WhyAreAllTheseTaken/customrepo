LARAVEL_VERSION = 5.9.0
LARAVEL_REVISION = 9
LARAVEL_PACKAGE = laravel-installer_$(LARAVEL_VERSION)-$(LARAVEL_REVISION)

$(REPO)/$(LARAVEL_PACKAGE).deb:
	echo "Packaging $(LARAVEL_PACKAGE)..."
	mkdir -p $(LARAVEL_PACKAGE)/etc/shadow-maint/useradd-post.d/
	cp laravel_useradd.sh $(LARAVEL_PACKAGE)/etc/shadow-maint/useradd-post.d/laravel.sh
	chmod +x $(LARAVEL_PACKAGE)/etc/shadow-maint/useradd-post.d/laravel.sh
	mkdir -p $(LARAVEL_PACKAGE)/DEBIAN
	cp laravel_postinst.sh $(LARAVEL_PACKAGE)/DEBIAN/postinst
	chmod +x $(LARAVEL_PACKAGE)/DEBIAN/postinst
	cp laravel_prerm.sh $(LARAVEL_PACKAGE)/DEBIAN/prerm
	chmod +x $(LARAVEL_PACKAGE)/DEBIAN/prerm
	cp laravel_control $(LARAVEL_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(LARAVEL_PACKAGE)
	mv $(LARAVEL_PACKAGE).deb $(REPO)
	rm -rf $(LARAVEL_PACKAGE)


