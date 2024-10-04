NNN_VERSION = 4.7
NNN_PLUGS_REVISION = 1
NNN_PLUGS_PACKAGE = nnn-plugins_$(NNN_VERSION)-$(NNN_PLUGS_REVISION)

$(NNN_PLUGS_PACKAGE).deb:
	rm -rf nnn
	git clone --depth 1 --branch v$(NNN_VERSION) https://github.com/jarun/nnn.git
	mkdir -p $(NNN_PLUGS_PACKAGE)/etc/skel/.config/nnn/plugins
	cp -rv ./nnn/plugins/* $(NNN_PLUGS_PACKAGE)/etc/skel/.config/nnn/plugins
	mkdir -p $(NNN_PLUGS_PACKAGE)/DEBIAN
	cp nnn_plugs_control $(NNN_PLUGS_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(NNN_PLUGS_PACKAGE)
	rm -rf nnn
	rm -rf $(NNN_PLUGS_PACKAGE)

