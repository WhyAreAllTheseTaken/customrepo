%-web_all: % web_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/bin/
	cp web.sh $@/usr/bin/$<-web
	chmod +x $@/usr/bin/$<-web
	sed -i "s/%url%/$$(cat $<)/g" $@/usr/bin/$<-web
	mkdir -p $@/DEBIAN
	cp desktop/web/control $@/DEBIAN/control
	sed -i "s/%name%/\l$</g" $@/DEBIAN/control
	sed -i "s/%url%/$$(cat $<)/g" $@/DEBIAN/control

web_sites: repo/github-web_all.deb repo/soundcloud-web_all.deb repo/todoist-web_all.deb repo/toggl-track-web_all.deb

