OBSIDIAN_VERSION = 1.7.4
OBSIDIAN_PACKAGE = obsidian_$(OBSIDIAN_VERSION)_amd64

$(REPO)/$(OBSIDIAN_PACKAGE).deb:
	echo "Downloading $(OBSIDIAN_PACKAGE)..."
	wget --show-progress -O $(REPO)/$(OBSIDIAN_PACKAGE).deb https://github.com/obsidianmd/obsidian-releases/releases/download/v$(OBSIDIAN_VERSION)/obsidian_$(OBSIDIAN_VERSION)_amd64.deb

