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

WHY_ZSH_VERSION = 0.0.0
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

