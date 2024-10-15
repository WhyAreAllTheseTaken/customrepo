SKEL_VERSION = 0.0.1
SKEL_REVISION = 1
SKEL_PACKAGE = skel-fixer_$(SKEL_VERSION)-$(SKEL_REVISION)

$(SKEL_PACKAGE).deb:
	mkdir -p $(SKEL_PACKAGE)/DEBIAN
	mkdir -p $(SKEL_PACKAGE)/usr/bin/
	cp skel-fixer.sh $(SKEL_PACKAGE)/usr/bin/skel-fixer
	chmod +x $(SKEL_PACKAGE)/usr/bin/skel-fixer
	mkdir -p $(SKEL_PACKAGE)/etc/shadow-maint/useradd-post.d/
	cp skel-fixer_useradd.sh $(SKEL_PACKAGE)/etc/shadow-maint/useradd-post.d/skel-fix_useradd.sh
	chmod +x $(SKEL_PACKAGE)/etc/shadow-maint/useradd-post.d/skel-fix_useradd.sh
	cp skel-fixer_control $(SKEL_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(SKEL_PACKAGE)
	rm -rf $(SKEL_PACKAGE)

