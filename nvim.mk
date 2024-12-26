NVIM_VERSION = 0.10.2
NVIM_PACKAGE = nvim_$(NVIM_VERSION)_$(ARCH)

$(REPO)/$(NVIM_PACKAGE).deb:
	echo "Building $(NVIM_PACKAGE)..."
	rm -rf neovim
	git clone --depth 1 --branch v$(NVIM_VERSION) https://github.com/neovim/neovim
	cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
	cd neovim && cd build && cpack -G DEB
	cp neovim/build/nvim-linux64.deb $(REPO)/$(NVIM_PACKAGE).deb
	rm -rf neovim

PACKER_PACKAGE = packer-nvim_all

packer-nvim_all: packer_control
	echo "Packaging $@..."
	rm -rf $@
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $@/etc/skel/.local/share/nvim/site/pack/packer/start/packer.nvim
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

