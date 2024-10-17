.PHONY: build packages install

build: updater

include *.mk

updater: $(UPDATER_PACKAGE).deb

install:
	apt install ./$(UPDATER_PACKAGE).deb

packages: $(CPMV_PACKAGE).deb $(JDK_PACKAGE).deb $(LTSA_PACKAGE).deb nvim-linux64.deb $(PACKER_PACKAGE).deb \
	$(FRITURE_PACKAGE).deb $(I3_BLOCKS_PACKAGE).deb $(WINGS_PLASMA_PACKAGE).deb $(NNN_PLUGS_PACKAGE).deb \
	$(I3LOCK_COLOR_PACKAGE).deb $(BETTER_LOCK_PACKAGE).deb $(DISCORD_PACKAGE).deb $(OBSIDIAN_PACKAGE).deb \
	$(RUSTUP_PACKAGE).deb $(GHCUP_PACKAGE).deb $(WHY_NNN_PACKAGE).deb $(WHY_NVIM_PACKAGE).deb \
	$(WHY_ZSH_PACKAGE).deb $(WHY_NEOFETCH_PACKAGE).deb $(WHY_CAVA_PACKAGE).deb $(WHY_HTOP_PACKAGE).deb \
	$(WHY_DESKTOP_PACKAGE).deb $(WHY_TERM_PACKAGE).deb $(WHY_APPS_PACKAGE).deb $(ONLYOFFICE_PACKAGE).deb \
	vivaldi.deb bluemail.deb $(WHY_UNI_PACKAGE).deb $(WHY_DEV_PACKAGE).deb $(JABREF_PACKAGE).deb \
	$(LARAVEL_PACKAGE).deb $(GNAT_PACKAGE).deb $(UPGRADE_PACKAGE).deb $(SKEL_PACKAGE).deb \
	$(GPLATES_PACKAGE).deb

