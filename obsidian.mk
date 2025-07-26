OBSIDIAN_VERSION = 1.8.10
OBSIDIAN_PACKAGE = obsidian_$(OBSIDIAN_VERSION)_amd64

$(REPO)/obsidian_%_amd64.deb:
	echo "Downloading $@..."
	wget --show-progress -O $@ https://github.com/obsidianmd/obsidian-releases/releases/download/v$*/obsidian_$@_amd64.deb

