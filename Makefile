SHELL := /usr/bin/bash

.PHONY: build packages install

.SUFFIXES:

ARCH=$(shell dpkg --print-architecture)

build: updater

REPO = repo

include *.mk desktop/*.mk dev/*.mk uni/*.mk

updater: $(REPO)/$(CUDA_KEYRING_PACKAGE).deb $(REPO)/$(UPDATER_PACKAGE).deb $(REPO)/$(MS_PACKAGE).deb

install:
	apt install ./$(REPO)/$(MS_PACKAGE).deb ./$(REPO)/$(UPDATER_PACKAGE).deb ./$(REPO)/$(CUDA_KEYRING_PACKAGE).deb

packages: $(REPO)/$(CPMV_PACKAGE).deb $(REPO)/$(JDK_PACKAGE).deb $(REPO)/$(LTSA_PACKAGE).deb $(REPO)/$(NVIM_PACKAGE).deb $(REPO)/$(PACKER_PACKAGE).deb \
	$(REPO)/$(FRITURE_PACKAGE).deb $(REPO)/$(I3_BLOCKS_PACKAGE).deb $(REPO)/$(NNN_PLUGS_PACKAGE).deb \
	$(REPO)/$(I3LOCK_COLOR_PACKAGE).deb $(REPO)/$(BETTER_LOCK_PACKAGE).deb $(REPO)/$(OBSIDIAN_PACKAGE).deb \
	$(REPO)/$(RUSTUP_PACKAGE).deb $(REPO)/$(GHCUP_PACKAGE).deb $(REPO)/$(WHY_NNN_PACKAGE).deb $(REPO)/$(WHY_NVIM_PACKAGE).deb \
	$(REPO)/$(WHY_ZSH_PACKAGE).deb \
	$(REPO)/$(WHY_DESKTOP_PACKAGE).deb $(REPO)/$(WHY_TERM_PACKAGE).deb $(REPO)/$(WHY_APPS_PACKAGE).deb $(REPO)/$(ONLYOFFICE_PACKAGE).deb \
	$(REPO)/$(VIVALDI_PACKAGE).deb $(REPO)/bluemail_amd64.deb $(REPO)/$(WHY_UNI_PACKAGE).deb $(REPO)/$(WHY_DEV_PACKAGE).deb $(REPO)/$(JABREF_PACKAGE).deb \
	$(REPO)/$(LARAVEL_PACKAGE).deb $(REPO)/$(UPGRADE_PACKAGE).deb \
	$(REPO)/$(GPLATES_PACKAGE).deb $(REPO)/$(RUST_CHAIN_PACKAGE).deb $(REPO)/$(RUST_NIGHTLY_PACKAGE).deb $(REPO)/$(MIRI_PACKAGE).deb \
	$(REPO)/$(JDK21_PACKAGE).deb $(REPO)/$(JDK23_PACKAGE).deb $(REPO)/$(JDK21_PACKAGE_ARM64).deb $(REPO)/$(JDK23_PACKAGE_ARM64).deb \
	$(REPO)/$(WHY_UNI_NVIDIA_PACKAGE).deb $(REPO)/$(STEAM_PACKAGE).deb $(REPO)/$(WHY_STEAM_PACKAGE).deb $(REPO)/$(MINECRAFT_PACKAGE).deb \
	$(REPO)/$(WHY_DEV_ADA_PACKAGE).deb $(REPO)/$(WHY_DEV_BASE_PACKAGE).deb $(REPO)/$(WHY_DEV_HASKELL_PACKAGE).deb $(REPO)/$(WHY_DEV_JAVA_PACKAGE).deb \
	$(REPO)/$(WHY_DEV_MINECRAFT_PACKAGE).deb $(REPO)/$(WHY_DEV_ML_PACKAGE).deb $(REPO)/$(WHY_DEV_ML_NVIDIA_PACKAGE).deb $(REPO)/$(WHY_DEV_NET_PACKAGE).deb \
	$(REPO)/$(WHY_DEV_PHP_PACKAGE).deb $(REPO)/$(WHY_DEV_PROLOG_PACKAGE).deb $(REPO)/$(WHY_DEV_RUST_PACKAGE).deb $(REPO)/$(WHY_DEV_UNITY_PACKAGE).deb \
	$(REPO)/$(WHY_WRITE_PACKAGE).deb $(REPO)/$(WHY_DEV_REPO_PACKAGE).deb $(REPO)/$(WHY_CYCLE_PACKAGE).deb themes \
	plasma_theme_set $(REPO)/$(MULTIMC_PACKAGE).deb discord_versions $(REPO)/why-worldbuilding_all.deb

