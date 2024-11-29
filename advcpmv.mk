CPMV_VERSION = 0.9
CPMV_REVISION = 4
CPMV_PACKAGE = advcpmv_$(CPMV_VERSION)-$(CPMV_REVISION)
CPMV_PATH = advcpmv/$(CPMV_PACKAGE)

$(REPO)/$(CPMV_PACKAGE).deb:
	echo "Building $(CPMV_PACKAGE)..."
	rm -rf $(CPMV_PATH)
	curl https://raw.githubusercontent.com/jarun/advcpmv/master/install.sh --create-dirs -o ./advcpmv/install.sh
	cd advcpmv && sh install.sh
	mkdir -p $(CPMV_PATH)/usr/bin/
	cp ./advcpmv/advcp $(CPMV_PATH)/usr/bin/cpg
	cp ./advcpmv/advmv $(CPMV_PATH)/usr/bin/mvg
	mkdir -p $(CPMV_PATH)/DEBIAN
	cp ./advcpmv_control $(CPMV_PATH)/DEBIAN/control
	sed -i "s/%arch%/$(ARCH)/g" $(CPMV_PATH)/DEBIAN/control
	dpkg-deb --build $(CPMV_PATH)
	mv advcpmv/$(CPMV_PACKAGE).deb $(REPO)/$(CPMV_PACKAGE).deb
	rm -rf advcpmv
	rm -rf $(CPMV_PATH)

