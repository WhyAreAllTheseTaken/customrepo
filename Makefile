.PHONY: build packages repo install

build: updater

repo: packages
	mkdir -p repo
	cp *.deb repo

include *.mk

updater: $(UPDATER_PACKAGE).deb

install:
	apt install ./$(UPDATER_PACKAGE).deb

packages: $(CPMV_PACKAGE).deb $(JDK_PACKAGE).deb $(LTSA_PACKAGE).deb nvim-linux64.deb $(PACKER_PACKAGE).deb \
	$(UPDATER_PACKAGE).deb $(FRITURE_PACKAGE).deb $(I3_BLOCKS_PACKAGE).deb $(WINGS_PLASMA_PACKAGE).deb

