OBSIDIAN_VERSION = 1.3.5
OBSIDIAN_PACKAGE = obsidian_$(OBSIDIAN_VERSION)

$(REPO)/$(OBSIDIAN_PACKAGE).deb:
	wget --show-progress -O $(REPO)/$(OBSIDIAN_PACKAGE).deb https://github.com/obsidianmd/obsidian-releases/releases/download/v$(OBSIDIAN_VERSION)/obsidian_$(OBSIDIAN_VERSION)_amd64.deb

