UPDATER_VERSION = 0.0.0
UPDATER_REVISION = 1
UPDATER_PACKAGE = custom-repo_$(UPDATER_VERSION)-$(UPDATER_REVISION)

$(UPDATER_PACKAGE).deb:
	mkdir -p $(UPDATER_PACKAGE)/usr/
	mkdir -p $(UPDATER_PACKAGE)/usr/sbin/
	mkdir -p $(UPDATER_PACKAGE)/etc/apt/source.list.d/
	cp ./custom_repo_build.sh $(UPDATER_PACKAGE)/usr/sbin/custom_repo_build
	chmod +x $(UPDATER_PACKAGE)/usr/sbin/custom_repo_build
	cp ./custom_repo.list $(UPDATER_PACKAGE)/etc/apt/source.list.d/
	git clone --depth 1 "https://github.com/WhyAreAllTheseTaken/customrepo.git" $(UPDATER_PACKAGE)/usr/customrepo
	mkdir -p $(UPDATER_PACKAGE)/DEBIAN
	cp update_control $(UPDATER_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(UPDATER_PACKAGE)

