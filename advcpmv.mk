CPMV_VERSION = 0.9
CPMV_REVISION = 2
CPMV_PACKAGE = advcpmv_$(CPMV_VERSION)-$(CPMV_REVISION)
CPMV_PATH = advcpmv/$(CPMV_PACKAGE)

$(CPMV_PACKAGE).deb:
	curl https://raw.githubusercontent.com/jarun/advcpmv/master/install.sh --create-dirs -o ./advcpmv/install.sh
	cd advcpmv && sh install.sh
	mkdir -p $(CPMV_PATH)/usr/bin/
	cp ./advcpmv/advcp $(CPMV_PATH)/usr/bin/
	cp ./advcpmv/advmv $(CPMV_PATH)/usr/bin/
	mkdir -p $(CPMV_PATH)/DEBIAN
	cp ./advcpmv_control $(CPMV_PATH)/DEBIAN/control
	dpkg-deb --build $(CPMV_PATH)
	cp advcpmv/$(CPMV_PACKAGE).deb .
	rm -rf advcpmv
	rm -rf $(CPMV_PATH)

