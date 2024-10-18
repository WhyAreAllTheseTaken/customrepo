OBSIDIAN_VERSION = 1.7.4
OBSIDIAN_PACKAGE = obsidian_$(OBSIDIAN_VERSION)

$(OBSIDIAN_PACKAGE).deb:
	wget --show-progress -O $(OBSIDIAN_PACKAGE).deb https://github.com/obsidianmd/obsidian-releases/releases/download/v$(OBSIDIAN_VERSION)/obsidian_$(OBSIDIAN_VERSION)_amd64.deb

