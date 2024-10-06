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
	$(FRITURE_PACKAGE).deb $(I3_BLOCKS_PACKAGE).deb $(WINGS_PLASMA_PACKAGE).deb $(NNN_PLUGS_PACKAGE).deb \
	$(I3LOCK_COLOR_PACKAGE).deb $(BETTER_LOCK_PACKAGE).deb discord $(OBSIDIAN_PACKAGE).deb \
	$(RUSTUP_PACKAGE).deb $(GHCUP_PACKAGE).deb $(WHY_NNN_PACKAGE).deb $(WHY_NVIM_PACKAGE).deb \
	$(WHY_ZSH_PACKAGE).deb $(WHY_NEOFETCH_PACKAGE).deb $(WHY_CAVA_PACKAGE).deb $(WHY_HTOP_PACKAGE).deb \
	$(WHY_DESKTOP_PACKAGE).deb $(WHY_TERM_PACKAGE).deb

