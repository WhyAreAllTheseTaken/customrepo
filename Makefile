SHELL := /usr/bin/bash

.PHONY: build packages install

.SUFFIXES:

ARCH=$(shell dpkg --print-architecture)

build: updater

REPO = repo

include *.mk desktop/*.mk dev/*.mk uni/*.mk

updater: $(REPO)/$(UPDATER_PACKAGE).deb $(REPO)/$(MS_PACKAGE).deb repo/morgwai-ntsync_all.deb

install:
	apt install ./$(REPO)/$(MS_PACKAGE).deb ./$(REPO)/$(UPDATER_PACKAGE).deb ./repo/morgwai-ntsync_all.deb

why-utils_all: utils_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

packages: repo/$(CPMV_PACKAGE).deb repo/$(JDK_PACKAGE).deb repo/$(LTSA_PACKAGE).deb repo/$(NVIM_PACKAGE).deb repo/$(PACKER_PACKAGE).deb \
	repo/$(FRITURE_PACKAGE).deb repo/$(I3_BLOCKS_PACKAGE).deb repo/$(NNN_PLUGS_PACKAGE).deb \
	repo/$(I3LOCK_COLOR_PACKAGE).deb repo/$(BETTER_LOCK_PACKAGE).deb repo/$(OBSIDIAN_PACKAGE).deb \
	repo/$(RUSTUP_PACKAGE).deb repo/$(GHCUP_PACKAGE).deb repo/$(WHY_NNN_PACKAGE).deb repo/$(WHY_NVIM_PACKAGE).deb \
	repo/$(WHY_ZSH_PACKAGE).deb \
	repo/$(WHY_DESKTOP_PACKAGE).deb repo/$(WHY_TERM_PACKAGE).deb repo/$(WHY_APPS_PACKAGE).deb repo/$(ONLYOFFICE_PACKAGE).deb \
	repo/$(VIVALDI_PACKAGE).deb repo/$(WHY_UNI_PACKAGE).deb repo/$(WHY_DEV_PACKAGE).deb repo/$(JABREF_PACKAGE).deb \
	repo/$(LARAVEL_PACKAGE).deb repo/$(UPGRADE_PACKAGE).deb \
	repo/$(RUST_CHAIN_PACKAGE).deb repo/$(RUST_NIGHTLY_PACKAGE).deb repo/$(MIRI_PACKAGE).deb \
	repo/$(JDK23_PACKAGE).deb repo/$(JDK21_PACKAGE_ARM64).deb repo/$(JDK23_PACKAGE_ARM64).deb \
	repo/$(WHY_UNI_NVIDIA_PACKAGE).deb repo/$(STEAM_PACKAGE).deb repo/$(WHY_STEAM_PACKAGE).deb repo/$(MINECRAFT_PACKAGE).deb \
	repo/$(WHY_DEV_ADA_PACKAGE).deb repo/$(WHY_DEV_BASE_PACKAGE).deb repo/$(WHY_DEV_HASKELL_PACKAGE).deb repo/$(WHY_DEV_JAVA_PACKAGE).deb \
	repo/$(WHY_DEV_MINECRAFT_PACKAGE).deb repo/$(WHY_DEV_ML_PACKAGE).deb repo/$(WHY_DEV_ML_NVIDIA_PACKAGE).deb repo/$(WHY_DEV_NET_PACKAGE).deb \
	repo/$(WHY_DEV_PHP_PACKAGE).deb repo/$(WHY_DEV_PROLOG_PACKAGE).deb repo/$(WHY_DEV_RUST_PACKAGE).deb repo/$(WHY_DEV_UNITY_PACKAGE).deb \
	repo/$(WHY_DEV_GFX_PACKAGE).deb \
	repo/$(WHY_WRITE_PACKAGE).deb repo/$(WHY_DEV_REPO_PACKAGE).deb repo/$(WHY_CYCLE_PACKAGE).deb themes \
	plasma_theme_set discord_versions repo/why-worldbuilding_all.deb repo/why-dev-image_all.deb \
	repo/fabric-installer_amd64.deb web_sites repo/code_amd64.deb repo/why-dev-engine_all.deb repo/why-dev-cpp_all.deb \
	repo/$(CHANGELOG_PACKAGE).deb repo/$(GRADLE_PACKAGE).deb repo/vineflower_all.deb blockbench repo/libgdk-pixbuf2.0-0_all.deb repo/skelfixer_all.deb \
	repo/materia-gtk-theme_all.deb repo/morgwai-ntsync_all.deb repo/why-utils_all.deb repo/$(CUDA_KEYRING_PACKAGE).deb

nonDefaultPackages: repo/$(BLUEMAIL_PACKAGE).deb repo/$(MULTIMC_PACKAGE).deb repo/bluemail_amd64.deb repo/$(GPLATES_PACKAGE).deb \
	repo/$(JDK21_PACKAGE).deb

