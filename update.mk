UPDATER_VERSION = 0.1.0
UPDATER_REVISION = 1
UPDATER_PACKAGE = custom-repo_$(UPDATER_VERSION)-$(UPDATER_REVISION)

$(UPDATER_PACKAGE).deb:
	rm -rfv $(UPDATER_PACKAGE)
	mkdir -p $(UPDATER_PACKAGE)/usr/
	mkdir -p $(UPDATER_PACKAGE)/usr/sbin/
	mkdir -p $(UPDATER_PACKAGE)/etc/apt/sources.list.d/
	cp ./custom_repo_build.sh $(UPDATER_PACKAGE)/usr/sbin/custom_repo_build
	chmod +x $(UPDATER_PACKAGE)/usr/sbin/custom_repo_build
	cp ./custom_repo.list $(UPDATER_PACKAGE)/etc/apt/sources.list.d/
	git clone --depth 1 "https://github.com/WhyAreAllTheseTaken/customrepo.git" $(UPDATER_PACKAGE)/usr/customrepo
	mkdir -p $(UPDATER_PACKAGE)/DEBIAN
	cp update_control $(UPDATER_PACKAGE)/DEBIAN/control
	cp update_postinst.sh $(UPDATER_PACKAGE)/DEBIAN/postinst
	chmod +x $(UPDATER_PACKAGE)/DEBIAN/postinst
	cp update_prerm.sh $(UPDATER_PACKAGE)/DEBIAN/prerm
	chmod +x $(UPDATER_PACKAGE)/DEBIAN/prerm
	cp update_postrm.sh $(UPDATER_PACKAGE)/DEBIAN/postrm
	chmod +x $(UPDATER_PACKAGE)/DEBIAN/postrm
	dpkg-deb --build $(UPDATER_PACKAGE)

