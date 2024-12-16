NVIM_VERSION = 0.10.2
NVIM_PACKAGE = nvim_$(NVIM_VERSION)_$(ARCH)

$(REPO)/$(NVIM_PACKAGE).deb:
	echo "Building $(NVIM_PACKAGE)..."
	git clone --depth 1 --branch v$(NVIM_VERSION) https://github.com/neovim/neovim
	cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
	cd neovim && cd build && cpack -G DEB
	cp neovim/build/nvim-linux64.deb $(REPO)/$(NVIM_PACKAGE).deb
	rm -rf neovim

PACKER_VERSION = 1.0
PACKER_REVISION = 5
PACKER_PACKAGE = packer-nvim_$(PACKER_VERSION)-$(PACKER_REVISION)_all

$(REPO)/$(PACKER_PACKAGE).deb:
	echo "Packaging $(PACKER_PACKAGE)..."
	rm -rf $(PACKER_PACKAGE)
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $(PACKER_PACKAGE)/etc/skel/.local/share/nvim/site/pack/packer/start/packer.nvim
	mkdir -p $(PACKER_PACKAGE)/DEBIAN
	cp packer_control $(PACKER_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(PACKER_PACKAGE)
	mv $(PACKER_PACKAGE).deb $(REPO)
	rm -rf $(PACKER_PACKAGE) 

