I3_BLOCKS_VERSION = 2.0.0
I3_BLOCKS_REVISION = 1
I3_BLOCKS_PACKAGE = i3blocks-contrib_$(I3_BLOCKS_VERSION)-$(I3_BLOCKS_REVISION)

$(REPO)/$(I3_BLOCKS_PACKAGE).deb:
	echo "Packaging $(I3_BLOCKS_PACKAGE)..."
	rm -rf ./i3blocks-contrib
	git clone --depth 1 --branch v2.0.0 https://github.com/vivien/i3blocks-contrib.git
	mkdir -p $(I3_BLOCKS_PACKAGE)/etc/skel/.config/i3blocks/
	cp -r ./i3blocks-contrib/* $(I3_BLOCKS_PACKAGE)/etc/skel/.config/i3blocks
	mkdir -p $(I3_BLOCKS_PACKAGE)/DEBIAN
	cp i3_blocks_control $(I3_BLOCKS_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(I3_BLOCKS_PACKAGE)
	mv $(I3_BLOCKS_PACKAGE).deb $(REPO)
	rm -rf i3blocks-contrib
	rm -rf $(I3_BLOCKS_PACKAGE)


