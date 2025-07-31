morgwai-ntsync_all: ntsync_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir $@/etc/apt/keyrings/ 
	wget -O $@/etc/apt/keyrings/morgwai-obs.gpg https://build.opensuse.org/projects/home:morgwai/signing_keys/download?kind=gpg
	mkdir $@/etc/apt/sources.list.d/ 
	echo "deb [signed-by=/etc/apt/keyrings/morgwai-obs.gpg] http://download.opensuse.org/repositories/home:/morgwai:/ntsync/Debian_Testing /" > $@/etc/apt/sources.list.d/wine-ntsync.list
	mkdir $@/DEBIAN
	cp $< $@/DEBIAN/control

