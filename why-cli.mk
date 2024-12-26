WHY_NNN_PACKAGE = why-nnn_all

why-nnn_all: why-nnn_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/bin/
	cp ./start_nnn.sh $@/usr/bin/start_nnn
	chmod +x $@/usr/bin/start_nnn
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

WHY_NVIM_PACKAGE = why-neovim_all

why-neovim_all: why-nvim_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/etc/skel/.config/nvim
	cp -r whyconfig/home/.config/nvim/* $@/etc/skel/.config/nvim/
	mkdir -p $@/DEBIAN
	cp why-nvim_control $@/DEBIAN/control

WHY_ZSH_PACKAGE = why-shell_all

why-shell_all: why-zsh_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/etc/skel/
	cp -r whyconfig/home/.zshenv $@/etc/skel/.zshenv
	cp -r whyconfig/home/.zshrc $@/etc/skel/.zshrc
	cp -r whyconfig/home/.zshrc.zni $@/etc/skel/.zshrc.zni
	mkdir -p $@/DEBIAN
	cp why-zsh_control $@/DEBIAN/control
	cp why-zsh_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst

