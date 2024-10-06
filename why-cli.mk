WHY_NNN_VERSION = 0.0.0
WHY_NNN_REVISION = 1
WHY_NNN_PACKAGE = why-nnn_$(WHY_NNN_VERSION)-$(WHY_NNN_REVISION)

$(WHY_NNN_PACKAGE).deb:
	rm -rfv $(WHY_NNN_PACKAGE)
	mkdir -p $(WHY_NNN_PACKAGE)/usr/bin/
	cp ./start_nnn.sh $(WHY_NNN_PACKAGE)/usr/bin/start_nnn
	chmod +x $(WHY_NNN_PACKAGE)/usr/bin/start_nnn
	mkdir -p $(WHY_NNN_PACKAGE)/DEBIAN
	cp why-nnn_control $(WHY_NNN_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_NNN_PACKAGE)
	rm -rf $(WHY_NNN_PACKAGE)

WHY_NVIM_VERSION = 0.0.0
WHY_NVIM_REVISION = 1
WHY_NVIM_PACKAGE = why-neovim_$(WHY_NVIM_VERSION)-$(WHY_NVIM_REVISION)

$(WHY_NVIM_PACKAGE).deb:
	rm -rfv $(WHY_NVIM_PACKAGE)
	mkdir -p $(WHY_NVIM_PACKAGE)/etc/skel/.config/nvim
	cp -r whyconfig/home/.config/nvim/* $(WHY_NVIM_PACKAGE)/etc/skel/.config/nvim/
	mkdir -p $(WHY_NVIM_PACKAGE)/DEBIAN
	cp why-nvim_control $(WHY_NVIM_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_NVIM_PACKAGE)
	rm -rf $(WHY_NVIM_PACKAGE)

WHY_ZSH_VERSION = 0.2.0
WHY_ZSH_REVISION = 1
WHY_ZSH_PACKAGE = why-shell_$(WHY_ZSH_VERSION)-$(WHY_ZSH_REVISION)

$(WHY_ZSH_PACKAGE).deb:
	rm -rfv $(WHY_ZSH_PACKAGE)
	mkdir -p $(WHY_ZSH_PACKAGE)/etc/skel/
	cp -r whyconfig/home/.zshenv $(WHY_ZSH_PACKAGE)/etc/skel/.zshenv
	cp -r whyconfig/home/.zshrc $(WHY_ZSH_PACKAGE)/etc/skel/.zshrc
	cp -r whyconfig/home/.zshrc.zni $(WHY_ZSH_PACKAGE)/etc/skel/.zshrc.zni
	mkdir -p $(WHY_ZSH_PACKAGE)/DEBIAN
	cp why-zsh_control $(WHY_ZSH_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_ZSH_PACKAGE)
	rm -rf $(WHY_ZSH_PACKAGE)

WHY_NEOFETCH_VERSION = 0.0.0
WHY_NEOFETCH_REVISION = 1
WHY_NEOFETCH_PACKAGE = why-neofetch_$(WHY_NEOFETCH_VERSION)-$(WHY_NEOFETCH_REVISION)

$(WHY_NEOFETCH_PACKAGE).deb:
	rm -rfv $(WHY_NEOFETCH_PACKAGE)
	mkdir -p $(WHY_NEOFETCH_PACKAGE)/etc/skel/.config/neofetch
	cp -r whyconfig/home/.config/neofetch/config.conf $(WHY_NEOFETCH_PACKAGE)/etc/skel/.config/neofetch/
	mkdir -p $(WHY_NEOFETCH_PACKAGE)/DEBIAN
	cp why-neofetch_control $(WHY_NEOFETCH_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_NEOFETCH_PACKAGE)
	rm -rf $(WHY_NEOFETCH_PACKAGE)

WHY_CAVA_VERSION = 0.0.0
WHY_CAVA_REVISION = 1
WHY_CAVA_PACKAGE = why-cava_$(WHY_CAVA_VERSION)-$(WHY_CAVA_REVISION)

$(WHY_CAVA_PACKAGE).deb:
	rm -rfv $(WHY_CAVA_PACKAGE)
	mkdir -p $(WHY_CAVA_PACKAGE)/etc/skel/.config/cava
	cp -r whyconfig/home/.config/cava/config $(WHY_CAVA_PACKAGE)/etc/skel/.config/cava/
	mkdir -p $(WHY_CAVA_PACKAGE)/DEBIAN
	cp why-cava_control $(WHY_CAVA_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_CAVA_PACKAGE)
	rm -rf $(WHY_CAVA_PACKAGE)

