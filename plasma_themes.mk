%-Plasma-Themes: %
	rm -rf ./$@
	git clone --depth 1 https://github.com/L4ki/$@.git
	ls $@

%-plasma-theme_all: % %-Plasma-Themes
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/share/plasma/desktoptheme/
	if [[ -d $<-Plasma-Themes/$<\ Plasma\ Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ Plasma\ Themes/* $@/usr/share/plasma/desktoptheme/;\
	fi
	if [[ -d $<-Plasma-Themes/$<-Plasma-Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<-Plasma-Themes/* $@/usr/share/plasma/desktoptheme/;\
	fi
	cp -r ./$<-Plasma-Themes/$<\ Global\ Themes/* $@/usr/share/plasma/desktoptheme/
	mkdir -p $@/usr/share/plasma/look-and-feel/
	if [[ -d $<-Plasma-Themes/$<\ Splshscreens ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ Splshscreens/* $@/usr/share/plasma/look-and-feel/;\
	fi
	if [[ -d $<-Plasma-Themes/$<\ SDDM\ Themes ]]; then\
		mkdir -p $@/usr/share/sddm/themes/;\
		cp -r ./$<-Plasma-Themes/$<\ SDDM\ Themes/* $@/usr/share/sddm/themes/;\
	fi
	mkdir -p $@/usr/share/aurorae/themes/
	if [[ -d $<-Plasma-Themes/$<\ Window\ Decorations ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ Window\ Decorations/* $@/usr/share/aurorae/themes/;\
	fi
	if [[ -d $<-Plasma-Themes/$<\ Windows\ Decorations ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ Windows\ Decorations/* $@/usr/share/aurorae/themes/;\
	fi
	mkdir -p $@/usr/share/color-schemes/
	cp -r ./$<-Plasma-Themes/$<\ Color\ Schemes/* $@/usr/share/color-schemes/
	mkdir -p $@/DEBIAN
	cp plasma-theme_control $@/DEBIAN/control
	sed -i "s/%package%/\l$</g" $@/DEBIAN/control
	sed -i "s/%name%/$</g" $@/DEBIAN/control
	sed -i "s/%version%/$$(cat $<)/g" $@/DEBIAN/control

$(REPO)/%-plasma-theme_all.deb: %-plasma-theme_all
	dpkg-deb --build $<
	mv $<.deb $(REPO)

%-gtk-theme_all: % %-Plasma-Themes
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/share/themes/
	if [[ -d $<-Plasma-Themes/$<\ GTK\ Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ GTK\ Themes/* $@/usr/share/themes/;\
	fi
	if [[ -d $<-Plasma-Themes/$<-GTK ]]; then\
		cp -r ./$<-Plasma-Themes/$<-GTK/* $@/usr/share/themes/;\
	fi
	mkdir -p $@/DEBIAN
	cp gtk-theme_control $@/DEBIAN/control
	sed -i "s/%package%/\l$</g" $@/DEBIAN/control
	sed -i "s/%name%/$</g" $@/DEBIAN/control
	sed -i "s/%version%/$$(cat $<)/g" $@/DEBIAN/control

$(REPO)/%-gtk-theme_all.deb: %-gtk-theme_all
	dpkg-deb --build $<
	mv $<.deb $(REPO)

%-icon-theme_all: % %-Plasma-Themes
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/share/icons/
	if [[ -d $<-Plasma-Themes/$<\ Icon\ Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ Icon\ Themes/* $@/usr/share/icons/;\
	fi
	if [[ -d $<-Plasma-Themes/$<-Icons ]]; then\
		cp -r ./$<-Plasma-Themes/$<-Icons/* $@/usr/share/icons/;\
	fi
	mkdir -p $@/DEBIAN
	cp icon-theme_control $@/DEBIAN/control
	sed -i "s/%package%/\l$</g" $@/DEBIAN/control
	sed -i "s/%name%/$</g" $@/DEBIAN/control
	sed -i "s/%version%/$$(cat $<)/g" $@/DEBIAN/control

$(REPO)/%-icon-theme_all.deb: %-icon-theme_all
	dpkg-deb --build $<
	mv $<.deb $(REPO)

%-wallpapers_all: % %-Plasma-Themes
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/share/backgrounds/
	if [[ -d $<-Plasma-Themes/$<\ Wallpapers ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ Wallpapers/* $@/usr/share/backgrounds/;\
	fi
	if [[ -d $<-Plasma-Themes/$<-Wallpapers ]]; then\
		cp -r ./$<-Plasma-Themes/$<-Wallpapers/* $@/usr/share/backgrounds/;\
	fi
	mkdir -p $@/DEBIAN
	cp wallpaper_control $@/DEBIAN/control
	sed -i "s/%package%/\l$</g" $@/DEBIAN/control
	sed -i "s/%name%/$</g" $@/DEBIAN/control
	sed -i "s/%version%/$$(cat $<)/g" $@/DEBIAN/control

$(REPO)/%-wallpapers_all.deb: %-wallpapers_all
	dpkg-deb --build $<
	mv $<.deb $(REPO)

THEME_TARGETS=Infinity_themes Wings_themes

$(THEME_TARGETS):: %_themes: $(REPO)/%-plasma-theme_all.deb $(REPO)/%-icon-theme_all.deb \
	$(REPO)/%-wallpapers_all.deb $(REPO)/%-gtk-theme_all.deb

plasma_theme_set: $(THEME_TARGETS)
