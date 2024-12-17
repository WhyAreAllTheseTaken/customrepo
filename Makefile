.PHONY: build packages install

ARCH=$(shell dpkg --print-architecture)

build: updater

REPO = repo

include *.mk

updater: $(REPO)/$(CUDA_KEYRING_PACKAGE).deb $(REPO)/$(UPDATER_PACKAGE).deb $(REPO)/$(MS_PACKAGE).deb

install:
	apt install ./$(REPO)/$(MS_PACKAGE).deb ./$(REPO)/$(UPDATER_PACKAGE).deb

packages: $(REPO)/$(CPMV_PACKAGE).deb $(REPO)/$(JDK_PACKAGE).deb $(REPO)/$(LTSA_PACKAGE).deb $(REPO)/$(NVIM_PACKAGE).deb $(REPO)/$(PACKER_PACKAGE).deb \
	$(REPO)/$(FRITURE_PACKAGE).deb $(REPO)/$(I3_BLOCKS_PACKAGE).deb $(REPO)/$(WINGS_PLASMA_PACKAGE).deb $(REPO)/$(NNN_PLUGS_PACKAGE).deb \
	$(REPO)/$(I3LOCK_COLOR_PACKAGE).deb $(REPO)/$(BETTER_LOCK_PACKAGE).deb $(REPO)/$(DISCORD_PACKAGE).deb $(REPO)/$(OBSIDIAN_PACKAGE).deb \
	$(REPO)/$(RUSTUP_PACKAGE).deb $(REPO)/$(GHCUP_PACKAGE).deb $(REPO)/$(WHY_NNN_PACKAGE).deb $(REPO)/$(WHY_NVIM_PACKAGE).deb \
	$(REPO)/$(WHY_ZSH_PACKAGE).deb $(REPO)/$(WHY_NEOFETCH_PACKAGE).deb $(REPO)/$(WHY_CAVA_PACKAGE).deb $(REPO)/$(WHY_HTOP_PACKAGE).deb \
	$(REPO)/$(WHY_DESKTOP_PACKAGE).deb $(REPO)/$(WHY_TERM_PACKAGE).deb $(REPO)/$(WHY_APPS_PACKAGE).deb $(REPO)/$(ONLYOFFICE_PACKAGE).deb \
	$(REPO)/$(VIVALDI_PACKAGE).deb $(REPO)/bluemail_amd64.deb $(REPO)/$(WHY_UNI_PACKAGE).deb $(REPO)/$(WHY_DEV_PACKAGE).deb $(REPO)/$(JABREF_PACKAGE).deb \
	$(REPO)/$(LARAVEL_PACKAGE).deb $(REPO)/$(UPGRADE_PACKAGE).deb $(REPO)/$(SKEL_PACKAGE).deb \
	$(REPO)/$(GPLATES_PACKAGE).deb $(REPO)/$(RUST_CHAIN_PACKAGE).deb $(REPO)/$(RUST_NIGHTLY_PACKAGE).deb $(REPO)/$(MIRI_PACKAGE).deb \
	$(REPO)/$(JDK21_PACKAGE).deb $(REPO)/$(JDK23_PACKAGE).deb $(REPO)/$(JDK21_PACKAGE_ARM64).deb $(REPO)/$(JDK23_PACKAGE_ARM64).deb \
	$(REPO)/$(WHY_UNI_NVIDIA_PACKAGE).deb $(REPO)/$(STEAM_PACKAGE).deb $(REPO)/$(WHY_STEAM_PACKAGE).deb $(REPO)/$(MINECRAFT_PACKAGE).deb

