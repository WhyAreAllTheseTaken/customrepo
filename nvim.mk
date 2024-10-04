nvim-linux64.deb:
	git clone --depth 1 --branch stable https://github.com/neovim/neovim
	cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
	cd neovim && cd build && cpack -G DEB
	cp neovim/build/nvim-linux64.deb .
	rm -rf neovim

PACKER_VERSION = 1.0
PACKER_REVISION = 2
PACKER_PACKAGE = packer-nvim_$(PACKER_VERSION)-$(PACKER_REVISION)

$(PACKER_PACKAGE).deb:
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $(PACKER_PACKAGE)/etc/skel/.local/share/nvim/site/pack/packer/start/packer.nvim
	mkdir -p $(PACKER_PACKAGE)/DEBIAN
	cp packer_control $(PACKER_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(PACKER_PACKAGE)
	rm -rf $(PACKER_PACKAGE) 

