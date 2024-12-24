WHY_DESKTOP_PACKAGE = why-desktop_all

$(REPO)/$(WHY_DESKTOP_PACKAGE).deb: desktop/why-desktop_control
	echo "Packaging $(WHY_DESKTOP_PACKAGE)..."
	rm -rf $(WHY_DESKTOP_PACKAGE)
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3
	cp whyconfig/home/.config/i3/config $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3blocks
	cp whyconfig/home/.config/i3blocks/i3blocks.conf $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/i3blocks
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/betterlockscreen
	cp whyconfig/home/.config/betterlockscreen/betterlockscreenrc $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/betterlockscreen
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/
	cp -r whyconfig/home/.config/picom.conf $(WHY_DESKTOP_PACKAGE)/etc/skel/.config/
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/skel/.local/
	echo "ice" > $(WHY_DESKTOP_PACKAGE)/etc/skel/.local/why-theme 
	echo "/usr/share/backgrounds/why-ice.png" > $(WHY_DESKTOP_PACKAGE)/etc/skel/.local/why-bg-path 
	mkdir -p $(WHY_DESKTOP_PACKAGE)/etc/lightdm/
	cp whyconfig/etc/lightdm/lightdm-gtk-greeter.conf $(WHY_DESKTOP_PACKAGE)/etc/lightdm/lightdm-gtk-greeter.conf.why
	mkdir -p $(WHY_DESKTOP_PACKAGE)/usr/bin/
	cp desktop/why-bg.sh $(WHY_DESKTOP_PACKAGE)/usr/bin/why-bg
	chmod +x $(WHY_DESKTOP_PACKAGE)/usr/bin/why-bg
	cp desktop/why-theme.sh $(WHY_DESKTOP_PACKAGE)/usr/bin/why-theme
	chmod +x $(WHY_DESKTOP_PACKAGE)/usr/bin/why-theme
	mkdir -p $(WHY_DESKTOP_PACKAGE)/DEBIAN
	cp desktop/why-desktop_control $(WHY_DESKTOP_PACKAGE)/DEBIAN/control
	cp desktop/why-desktop_postinst.sh $(WHY_DESKTOP_PACKAGE)/DEBIAN/postinst
	chmod +x $(WHY_DESKTOP_PACKAGE)/DEBIAN/postinst
	cp desktop/why-desktop_prerm.sh $(WHY_DESKTOP_PACKAGE)/DEBIAN/prerm
	chmod +x $(WHY_DESKTOP_PACKAGE)/DEBIAN/prerm
	dpkg-deb --build $(WHY_DESKTOP_PACKAGE)
	mv $(WHY_DESKTOP_PACKAGE).deb $(REPO)
	rm -rf $(WHY_DESKTOP_PACKAGE)

WHY_TERM_VERSION = 0.1.0
WHY_TERM_REVISION = 1
WHY_TERM_PACKAGE = why-terminal_$(WHY_TERM_VERSION)-$(WHY_TERM_REVISION)_all

$(REPO)/$(WHY_TERM_PACKAGE).deb:
	echo "Packaging $(WHY_TERM_PACKAGE)..."
	rm -rf $(WHY_TERM_PACKAGE)
	mkdir -p $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/
	cp -r whyconfig/home/.config/kitty/kitty.conf $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/
	cp -r whyconfig/home/.config/kitty/current-theme.conf $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/
	mkdir -p $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/themes/
	cp -r "whyconfig/home/.config/kitty/themes/Ice Tango Dark.conf" $(WHY_TERM_PACKAGE)/etc/skel/.config/kitty/themes/
	mkdir -p $(WHY_TERM_PACKAGE)/DEBIAN
	cp desktop/why-terminal_control $(WHY_TERM_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_TERM_PACKAGE)
	mv $(WHY_TERM_PACKAGE).deb $(REPO)
	rm -rf $(WHY_TERM_PACKAGE)

WHY_APPS_VERSION = 0.5.0
WHY_APPS_REVISION = 1
WHY_APPS_PACKAGE = why-apps_$(WHY_APPS_VERSION)-$(WHY_APPS_REVISION)_all

$(REPO)/$(WHY_APPS_PACKAGE).deb:
	echo "Packaging $(WHY_APPS_PACKAGE)..."
	rm -rf $(WHY_APPS_PACKAGE)
	mkdir -p $(WHY_APPS_PACKAGE)/DEBIAN
	cp desktop/why-apps_control $(WHY_APPS_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_APPS_PACKAGE)
	mv $(WHY_APPS_PACKAGE).deb $(REPO)
	rm -rf $(WHY_APPS_PACKAGE)

WHY_CYCLE_PACKAGE = why-cycle_all

$(REPO)/$(WHY_CYCLE_PACKAGE).deb: desktop/why-cycle_control
	echo "Packaging $(WHY_CYCLE_PACKAGE)..."
	rm -rf $(WHY_CYCLE_PACKAGE)
	mkdir -p $(WHY_CYCLE_PACKAGE)/usr/bin/
	cp desktop/why-cycle.sh $(WHY_CYCLE_PACKAGE)/usr/bin/why-cycle
	chmod +x $(WHY_CYCLE_PACKAGE)/usr/bin/why-cycle
	mkdir -p $(WHY_CYCLE_PACKAGE)/usr/sbin/
	cp desktop/why-cycle-all.sh $(WHY_CYCLE_PACKAGE)/usr/sbin/why-cycle-all
	chmod +x $(WHY_CYCLE_PACKAGE)/usr/sbin/why-cycle-all
	mkdir -p $(WHY_CYCLE_PACKAGE)/etc/systemd/system/
	cp desktop/why-cycle.service $(WHY_CYCLE_PACKAGE)/etc/systemd/system/
	cp desktop/why-cycle.timer $(WHY_CYCLE_PACKAGE)/etc/systemd/system/
	mkdir -p $(WHY_CYCLE_PACKAGE)/DEBIAN
	cp desktop/why-cycle_control $(WHY_CYCLE_PACKAGE)/DEBIAN/control
	cp desktop/why-cycle_postinst.sh $(WHY_CYCLE_PACKAGE)/DEBIAN/postinst
	chmod +x $(WHY_CYCLE_PACKAGE)/DEBIAN/postinst
	cp desktop/why-cycle_prerm.sh $(WHY_CYCLE_PACKAGE)/DEBIAN/prerm
	chmod +x $(WHY_CYCLE_PACKAGE)/DEBIAN/prerm
	cp desktop/why-cycle_postrm.sh $(WHY_CYCLE_PACKAGE)/DEBIAN/postrm
	chmod +x $(WHY_CYCLE_PACKAGE)/DEBIAN/postrm
	dpkg-deb --build $(WHY_CYCLE_PACKAGE)
	mv $(WHY_CYCLE_PACKAGE).deb $(REPO)
	rm -rf $(WHY_CYCLE_PACKAGE)

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
	cp $</default-bg /usr/share/why-desktop/theme/$(<F)/

$(REPO)/why-theme-%_all.deb: why-theme-%_all
	echo "Packaging $(@F)"
	dpkg-deb --build $<
	mv $(@F) $(REPO)

themes: $(REPO)/why-theme-ice_all.deb \
	$(REPO)/why-theme-ice-light_all.deb \
	$(REPO)/why-theme-dawn_all.deb \
	$(REPO)/why-theme-pink_all.deb

