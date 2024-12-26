UPDATER_VERSION = 0.10.1
UPDATER_REVISION = 1
UPDATER_PACKAGE = custom-repo_all

$(UPDATER_PACKAGE): update_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/
	mkdir -p $@/usr/sbin/
	mkdir -p $@/usr/share/keyrings
	mkdir -p $@/etc/apt/sources.list.d/
	cp ./custom_repo_build.sh $@/usr/sbin/custom_repo_build
	chmod +x $@/usr/sbin/custom_repo_build
	cp ./custom_repo.list $@/etc/apt/sources.list.d/
	cp ./unity_repo.list $@/etc/apt/sources.list.d/
	git clone --depth 1 "https://github.com/WhyAreAllTheseTaken/customrepo.git" $@/usr/customrepo
	wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | tee $@/usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control
	cp update_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp update_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm
	cp update_postrm.sh $@/DEBIAN/postrm
	chmod +x $@/DEBIAN/postrm

UPGRADE_PACKAGE = why-upgrade_all

why-upgrade_all: why-upgrade_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/sbin/
	cp ./why_upgrade.sh $@/usr/sbin/why_upgrade
	chmod +x $@/usr/sbin/why_upgrade
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

