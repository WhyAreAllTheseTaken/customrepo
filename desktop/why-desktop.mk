WHY_DESKTOP_PACKAGE = why-desktop_all

$(WHY_DESKTOP_PACKAGE): desktop/why-desktop_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/etc/skel/.config/i3
	cp whyconfig/home/.config/i3/config $@/etc/skel/.config/i3
	mkdir -p $@/etc/skel/.config/i3blocks
	cp whyconfig/home/.config/i3blocks/i3blocks.conf $@/etc/skel/.config/i3blocks
	mkdir -p $@/etc/skel/.config/betterlockscreen
	cp whyconfig/home/.config/betterlockscreen/betterlockscreenrc $@/etc/skel/.config/betterlockscreen
	mkdir -p $@/etc/skel/.config/
	cp -r whyconfig/home/.config/picom.conf $@/etc/skel/.config/
	mkdir -p $@/etc/skel/.local/
	echo "ice" > $@/etc/skel/.local/why-theme 
	echo "/usr/share/backgrounds/why-ice.png" > $@/etc/skel/.local/why-bg-path 
	mkdir -p $@/etc/lightdm/
	cp whyconfig/etc/lightdm/lightdm-gtk-greeter.conf $@/etc/lightdm/lightdm-gtk-greeter.conf.why
	mkdir -p $@/usr/bin/
	cp desktop/why-bg.sh $@/usr/bin/why-bg
	chmod +x $@/usr/bin/why-bg
	cp desktop/why-theme.sh $@/usr/bin/why-theme
	chmod +x $@/usr/bin/why-theme
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control
	cp desktop/why-desktop_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp desktop/why-desktop_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm

WHY_TERM_PACKAGE = why-terminal_all

$(WHY_TERM_PACKAGE): desktop/why-terminal_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/etc/skel/.config/kitty/
	cp -r whyconfig/home/.config/kitty/kitty.conf $@/etc/skel/.config/kitty/
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

WHY_APPS_PACKAGE = why-apps_all

$(WHY_APPS_PACKAGE): desktop/why-apps_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

WHY_CYCLE_PACKAGE = why-cycle_all

$(WHY_CYCLE_PACKAGE): desktop/why-cycle_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/bin/
	cp desktop/why-cycle.sh $@/usr/bin/why-cycle
	chmod +x $@/usr/bin/why-cycle
	mkdir -p $@/usr/lib/systemd/user/
	cp desktop/why-cycle.service $@/usr/lib/systemd/user/
	cp desktop/why-cycle.timer $@/usr/lib/systemd/user/
	mkdir -p $@/DEBIAN
	cp desktop/why-cycle_control $@/DEBIAN/control
	cp desktop/why-cycle_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp desktop/why-cycle_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm
	cp desktop/why-cycle_postrm.sh $@/DEBIAN/postrm
	chmod +x $@/DEBIAN/postrm

why-theme-%_all: desktop/theme/% desktop/theme/%/control
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp $</control $@/DEBIAN/control
	cp desktop/theme/postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	mkdir -p $@/usr/share/why-desktop/theme/$(<F)/
	cp -r $</home $@/usr/share/why-desktop/theme/$(<F)/
	mkdir -p $@/usr/share/why-desktop/theme/$(<F)/
	cp -r $</config $@/usr/share/why-desktop/theme/$(<F)/
	mkdir -p $@/usr/share/why-desktop/theme/$(<F)/
	-cp -rT $</share $@/usr/share/why-desktop/theme/$(<F)/
	mkdir -p $@/usr/share/backgrounds
	-cp -r $</bg/* $@/usr/share/backgrounds
	cp $</default-bg $@/usr/share/why-desktop/theme/$(<F)/

repo/materia-gtk-theme_all.deb:
	echo "Downloading $@..."
	wget --show-progress -O $@ "https://deb.debian.org/debian/pool/main/m/materia-gtk-theme/materia-gtk-theme_20200916-0.2_all.deb"

themes: $(REPO)/why-theme-ice_all.deb \
	$(REPO)/why-theme-ice-light_all.deb \
	$(REPO)/why-theme-dawn_all.deb \
	$(REPO)/why-theme-night_all.deb \
	$(REPO)/why-theme-pink_all.deb

