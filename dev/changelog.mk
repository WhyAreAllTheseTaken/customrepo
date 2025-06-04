CHANGELOG_VERSION = 3.9.0
CHANGELOG_PACKAGE = changelog-from-release_$(ARCH)

changelog-from-release_%_linux_amd64.tar.gz:
	echo "Downloading $@..."
	wget --show-progress -O $@ https://github.com/rhysd/changelog-from-release/releases/download/v$*/$@

changelog-from-release_%_linux_arm64.tar.gz:
	echo "Downloading $@..."
	wget --show-progress -O $@ https://github.com/rhysd/changelog-from-release/releases/download/v$*/$@

changelog-from-release_%_linux_armv6.tar.gz:
	echo "Downloading $@..."
	wget --show-progress -O $@ https://github.com/rhysd/changelog-from-release/releases/download/v$*/$@

changelog-from-release_%_linux_amd64: changelog-from-release_%_linux_amd64.tar.gz
	tar xvfz $<

changelog-from-release_%_linux_arm64: changelog-from-release_%_linux_arm64.tar.gz
	tar xvfz $<

changelog-from-release_%_linux_armv6: changelog-from-release_%_linux_armv6.tar.gz
	tar xvfz $<

changelog-from-release_amd64: dev/changelog_control changelog-from-release_$(CHANGELOG_VERSION)_linux_amd64
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	mkdir -p $@/usr/bin/
	cp $(filter-out $<,$^)/changelog-from-release $@/usr/bin/
	chmod +x $@/usr/bin/changelog-from-release
	cp $< $@/DEBIAN/control
	sed -i "s/%arch%/amd64/g" $@/DEBIAN/control

changelog-from-release_arm64: dev/changelog_control changelog-from-release_$(CHANGELOG_VERSION)_linux_arm64
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	mkdir -p $@/usr/bin/
	cp $(filter-out $<,$^)/changelog-from-release $@/usr/bin/
	chmod +x $@/usr/bin/changelog-from-release
	cp $< $@/DEBIAN/control
	sed -i "s/%arch%/arm64/g" $@/DEBIAN/control

changelog-from-release_arm: dev/changelog_control changelog-from-release_$(CHANGELOG_VERSION)_linux_armv6
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	mkdir -p $@/usr/bin/
	cp $(filter-out $<,$^)/changelog-from-release $@/usr/bin/
	chmod +x $@/usr/bin/changelog-from-release
	cp $< $@/DEBIAN/control
	sed -i "s/%arch%/arm/g" $@/DEBIAN/control

