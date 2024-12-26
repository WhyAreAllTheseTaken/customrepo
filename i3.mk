I3_BLOCKS_PACKAGE = i3blocks-contrib_all

$(I3_BLOCKS_PACKAGE): i3_blocks_control
	echo "Packaging $@..."
	rm -rf $@
	rm -rf ./i3blocks-contrib
	git clone --depth 1 --branch v2.0.0 https://github.com/vivien/i3blocks-contrib.git
	mkdir -p $@/etc/skel/.config/i3blocks/
	cp -r ./i3blocks-contrib/* $@/etc/skel/.config/i3blocks
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control
	rm -rf i3blocks-contrib

