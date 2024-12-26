GHCUP_PACKAGE = ghcup_all

ghcup_all: dev/ghcup_control
	echo "Packaging $@..."
	mkdir -p $@/DEBIAN
	mkdir -p $@/usr/share/ghcup_deb
	wget --show-progress -O $@/usr/share/ghcup_deb/ghcup_setup.sh https://get-ghcup.haskell.org
	chmod +x $@/usr/share/ghcup_deb/ghcup_setup.sh
	cp dev/ghcup_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp dev/ghcup_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm
	cp $< $@/DEBIAN/control

