NNN_VERSION = 4.7
NNN_PLUGS_REVISION = 3
NNN_PLUGS_PACKAGE = nnn-plugins_all

nnn-plugins_all:
	echo "Packaging $@..."
	rm -rf $@
	rm -rf nnn
	git clone --depth 1 --branch v$(NNN_VERSION) https://github.com/jarun/nnn.git
	mkdir -p $@/etc/skel/.config/nnn/plugins
	cp -r ./nnn/plugins/* $@/etc/skel/.config/nnn/plugins
	mkdir -p $@/DEBIAN
	cp nnn_plugs_control $@/DEBIAN/control
	rm -rf nnn

