.PHONY: build packages install

build: updater

REPO = repo

include *.mk

updater: $(REPO)/$(UPDATER_PACKAGE).deb

install:
	apt install ./repo/$(UPDATER_PACKAGE).deb

packages: $(REPO)/$(CPMV_PACKAGE).deb $(REPO)/$(JDK_PACKAGE).deb $(REPO)/$(LTSA_PACKAGE).deb $(REPO)/nvim-linux64.deb $(REPO)/$(PACKER_PACKAGE).deb \
	$(REPO)/$(FRITURE_PACKAGE).deb $(REPO)/$(I3_BLOCKS_PACKAGE).deb $(REPO)/$(WINGS_PLASMA_PACKAGE).deb $(REPO)/$(NNN_PLUGS_PACKAGE).deb \
	$(REPO)/$(I3LOCK_COLOR_PACKAGE).deb $(REPO)/$(BETTER_LOCK_PACKAGE).deb $(REPO)/$(DISCORD_PACKAGE).deb $(REPO)/$(OBSIDIAN_PACKAGE).deb \
	$(REPO)/$(RUSTUP_PACKAGE).deb $(REPO)/$(GHCUP_PACKAGE).deb $(REPO)/$(WHY_NNN_PACKAGE).deb $(REPO)/$(WHY_NVIM_PACKAGE).deb \
	$(REPO)/$(WHY_ZSH_PACKAGE).deb $(REPO)/$(WHY_NEOFETCH_PACKAGE).deb $(REPO)/$(WHY_CAVA_PACKAGE).deb $(REPO)/$(WHY_HTOP_PACKAGE).deb \
	$(REPO)/$(WHY_DESKTOP_PACKAGE).deb $(REPO)/$(WHY_TERM_PACKAGE).deb $(REPO)/$(WHY_APPS_PACKAGE).deb $(REPO)/$(ONLYOFFICE_PACKAGE).deb \
	$(REPO)/vivaldi.deb $(REPO)/bluemail.deb $(REPO)/$(WHY_UNI_PACKAGE).deb $(REPO)/$(WHY_DEV_PACKAGE).deb $(REPO)/$(JABREF_PACKAGE).deb \
	$(REPO)/$(LARAVEL_PACKAGE).deb $(REPO)/$(GNAT_PACKAGE).deb $(REPO)/$(UPGRADE_PACKAGE).deb $(REPO)/$(SKEL_PACKAGE).deb \
	$(REPO)/$(GPLATES_PACKAGE).deb

