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

changelog-from-release_%: dev/changelog_control changelog-from-release-$(CHANGELOG_VERSION)_linux_%
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	mkdir -p $@/usr/bin/
	cp $(filter-out $<,$^)/changelog-from-release $@/usr/bin/
	chmod +x $@/usr/bin/changelog-from-release
	cp $< $@/DEBIAN/control
	sed -i "s/%arch%/$*/g" $@/DEBIAN/control

