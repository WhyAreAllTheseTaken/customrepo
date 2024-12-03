UPDATER_VERSION = 0.9.0
UPDATER_REVISION = 2
UPDATER_PACKAGE = custom-repo_$(UPDATER_VERSION)-$(UPDATER_REVISION)

$(REPO)/$(UPDATER_PACKAGE).deb:
	echo "Packaging $(UPDATER_PACKAGE)..."
	rm -rf $(UPDATER_PACKAGE)
	mkdir -p $(UPDATER_PACKAGE)/usr/
	mkdir -p $(UPDATER_PACKAGE)/usr/sbin/
	mkdir -p $(UPDATER_PACKAGE)/usr/share/keyrings
	mkdir -p $(UPDATER_PACKAGE)/etc/apt/sources.list.d/
	cp ./custom_repo_build.sh $(UPDATER_PACKAGE)/usr/sbin/custom_repo_build
	chmod +x $(UPDATER_PACKAGE)/usr/sbin/custom_repo_build
	cp ./custom_repo.list $(UPDATER_PACKAGE)/etc/apt/sources.list.d/
	cp ./unity_repo.list $(UPDATER_PACKAGE)/etc/apt/sources.list.d/
	git clone --depth 1 "https://github.com/WhyAreAllTheseTaken/customrepo.git" $(UPDATER_PACKAGE)/usr/customrepo
	wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | tee $(UPDATER_PACKAGE)/usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null
	mkdir -p $(UPDATER_PACKAGE)/DEBIAN
	cp update_control $(UPDATER_PACKAGE)/DEBIAN/control
	cp update_postinst.sh $(UPDATER_PACKAGE)/DEBIAN/postinst
	chmod +x $(UPDATER_PACKAGE)/DEBIAN/postinst
	cp update_prerm.sh $(UPDATER_PACKAGE)/DEBIAN/prerm
	chmod +x $(UPDATER_PACKAGE)/DEBIAN/prerm
	cp update_postrm.sh $(UPDATER_PACKAGE)/DEBIAN/postrm
	chmod +x $(UPDATER_PACKAGE)/DEBIAN/postrm
	dpkg-deb --build $(UPDATER_PACKAGE)
	mv $(UPDATER_PACKAGE).deb $(REPO)
	rm -rf $(UPDATER_PACKAGE)

UPGRADE_VERSION = 0.0.0
UPGRADE_REVISION = 3
UPGRADE_PACKAGE = why-upgrade_$(UPGRADE_VERSION)-$(UPGRADE_REVISION)

$(REPO)/$(UPGRADE_PACKAGE).deb:
	echo "Packaging $(UPGRADE_PACKAGE)..."
	rm -rf $(UPGRADE_PACKAGE)
	mkdir -p $(UPGRADE_PACKAGE)/usr/sbin/
	cp ./why_upgrade.sh $(UPGRADE_PACKAGE)/usr/sbin/why_upgrade
	chmod +x $(UPGRADE_PACKAGE)/usr/sbin/why_upgrade
	mkdir -p $(UPGRADE_PACKAGE)/DEBIAN
	cp why-upgrade_control $(UPGRADE_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(UPGRADE_PACKAGE)
	mv $(UPGRADE_PACKAGE).deb $(REPO)
	rm -rf $(UPGRADE_PACKAGE)

