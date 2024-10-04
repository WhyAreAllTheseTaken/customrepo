.PHONY: packages repo install

repo: packages
	mkdir -p repo
	cp *.deb repo

include *.mk

install: $(UPDATER_PACKAGE).deb
	apt install $(UPDATER_PACKAGE).deb

packages: $(CPMV_PACKAGE).deb $(JDK_PACKAGE).deb $(LTSA_PACKAGE).deb nvim-linux64.deb $(PACKER_PACKAGE).deb $(UPDATER_PACKAGE).deb

