%-Plasma-Themes: %
	rm -rf ./$@
	git clone --depth 1 https://github.com/L4ki/$@.git
	ls $@

%-kde_all: % %-Plasma-Themes
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/share/plasma/desktoptheme/
	if [[ -d $<-Plasma-Themes/$<\ Plasma\ Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ Plasma\ Themes/* $@/usr/share/plasma/desktoptheme/;\
	fi
	if [[ -d $<-Plasma-Themes/$<-Plasma-Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<-Plasma-Themes/* $@/usr/share/plasma/desktoptheme/;\
	fi
	if [[ -d $<-Plasma-Themes/$<\ Global\ Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ Global\ Themes/* $@/usr/share/plasma/desktoptheme/;\
	fi
	if [[ -d $<-Plasma-Themes/$<-Global-6 ]]; then\
		cp -r ./$<-Plasma-Themes/$<-Global-6/* $@/usr/share/plasma/desktoptheme/;\
	fi
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
	if [[ -d $<-Plasma-Themes/Window\ Decorations\ For\ Plasma\ 6 ]]; then\
		cp -r ./$<-Plasma-Themes/Window\ Decorations\ For\ Plasma\ 6/* $@/usr/share/aurorae/themes/;\
	fi
	if [[ -d $<-Plasma-Themes/$<\ Color\ Schemes ]]; then\
		mkdir -p $@/usr/share/color-schemes/;\
		cp -r ./$<-Plasma-Themes/$<\ Color\ Schemes/* $@/usr/share/color-schemes/;\
	fi
	mkdir -p $@/DEBIAN
	cp kde_control $@/DEBIAN/control
	sed -i "s/%package%/\l$</g" $@/DEBIAN/control
	sed -i "s/%name%/$</g" $@/DEBIAN/control
	sed -i "s/%version%/$$(cat $<)/g" $@/DEBIAN/control

$(REPO)/%-kde_all.deb: %-kde_all
	-rm $@
	dpkg-deb --build $<
	mv $<.deb $(REPO)

%-gtk-theme_all: % %-Plasma-Themes
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/share/themes/
	if [[ -d $<-Plasma-Themes/$<\ GTK\ Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ GTK\ Themes/* $@/usr/share/themes/;\
	fi
	if [[ -d $<-Plasma-Themes/$<-GTK-Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<-GTK-Themes/* $@/usr/share/themes/;\
	fi
	if [[ -d $<-Plasma-Themes/$<-GTK ]]; then\
		cp -r ./$<-Plasma-Themes/$<-GTK/* $@/usr/share/themes/;\
	fi
	if [[ -f $@/usr/share/themes/settings.ini ]]; then\
		mkdir $@/usr/share/themes/$<-GTK;\
		mv $@/usr/share/themes/assets $@/usr/share/themes/$<-GTK || true;\
		mv $@/usr/share/themes/gtk-2.0 $@/usr/share/themes/$<-GTK || true;\
		mv $@/usr/share/themes/gtk-3.0 $@/usr/share/themes/$<-GTK || true;\
		mv $@/usr/share/themes/gtk-4.0 $@/usr/share/themes/$<-GTK || true;\
		mv $@/usr/share/themes/index.theme $@/usr/share/themes/$<-GTK || true;\
		mv $@/usr/share/themes/settings.ini $@/usr/share/themes/$<-GTK || true;\
	fi
	if [[ -f $@/usr/share/themes/Text\ File.txt ]]; then\
		rm $@/usr/share/themes/Text\ File.txt;\
	fi
	mkdir -p $@/DEBIAN
	cp gtk-theme_control $@/DEBIAN/control
	sed -i "s/%package%/\l$</g" $@/DEBIAN/control
	sed -i "s/%name%/$</g" $@/DEBIAN/control
	sed -i "s/%version%/$$(cat $<)/g" $@/DEBIAN/control

$(REPO)/%-gtk-theme_all.deb: %-gtk-theme_all
	-rm $@
	if [[ ! -z "$$( ls -A $</usr/share/themes/ )" ]]; then\
		dpkg-deb --build $<;\
		mv $<.deb $(REPO);\
	fi

%-icon-theme_all: % %-Plasma-Themes
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/share/icons/
	if [[ -d $<-Plasma-Themes/$<\ Icons\ Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ Icons\ Themes/* $@/usr/share/icons/;\
	fi
	if [[ -d $<-Plasma-Themes/$<\ Icon\ Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<\ Icon\ Themes/* $@/usr/share/icons/;\
	fi
	if [[ -d $<-Plasma-Themes/$<-Icon-Themes ]]; then\
		cp -r ./$<-Plasma-Themes/$<-Icon-Themes/* $@/usr/share/icons/;\
	fi
	if [[ -d $<-Plasma-Themes/$<-Icons ]]; then\
		cp -r ./$<-Plasma-Themes/$<-Icons/* $@/usr/share/icons/;\
	fi
	if [[ -f $@/usr/share/icons/Text\ File.txt ]]; then\
		rm $@/usr/share/icons/Text\ File.txt;\
	fi
	mkdir -p $@/DEBIAN
	cp icon-theme_control $@/DEBIAN/control
	sed -i "s/%package%/\l$</g" $@/DEBIAN/control
	sed -i "s/%name%/$</g" $@/DEBIAN/control
	sed -i "s/%version%/$$(cat $<)/g" $@/DEBIAN/control

$(REPO)/%-icon-theme_all.deb: %-icon-theme_all
	-rm $@
	if [[ ! -z "$$( ls -A $</usr/share/icons/ )" ]]; then\
		dpkg-deb --build $<;\
		mv $<.deb $(REPO);\
	fi

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
	-rm $@
	dpkg-deb --build $<
	mv $<.deb $(REPO)

THEME_TARGETS=Infinity_themes Wings_themes Relax_themes Cool_themes Gradient_themes Flight_themes Vivid_themes Colorful_themes \
			  Magna_themes Gently-Color_themes Bluish_themes Silvery_themes Viola_themes Vortex_themes Aretha_themes \
              Pax_themes Shadows_themes Fancy_themes Desert_themes Bonny_themes Mega_themes

$(THEME_TARGETS):: %_themes: $(REPO)/%-kde_all.deb $(REPO)/%-icon-theme_all.deb \
	$(REPO)/%-wallpapers_all.deb $(REPO)/%-gtk-theme_all.deb

plasma_theme_set: $(THEME_TARGETS)
