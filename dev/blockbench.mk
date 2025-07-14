BLOCKBENCH_VERSION = 4.12.5

$(REPO)/blockbench_%_all.deb:
	echo "Downloading $@..."
	wget --show-progress -O $@ https://github.com/JannisX11/blockbench/releases/download/v$*/Blockbench_$*.deb

blockbench: $(REPO)/blockbench_$(BLOCKBENCH_VERSION)_all.deb

