morgwai-ntsync_all: ntsync_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/etc/apt/keyrings/ 
	wget -O $@/etc/apt/keyrings/morgwai-obs.gpg https://build.opensuse.org/projects/home:morgwai/signing_keys/download?kind=gpg
	mkdir -p $@/etc/apt/sources.list.d/ 
	echo "deb [signed-by=/etc/apt/keyrings/morgwai-obs.gpg] http://download.opensuse.org/repositories/home:/morgwai:/ntsync/Debian_13 /" > $@/etc/apt/sources.list.d/wine-ntsync.list
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

