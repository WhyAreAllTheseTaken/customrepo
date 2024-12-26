WHY_UNI_PACKAGE = why-uni_all

$(WHY_UNI_PACKAGE): uni/why-uni_control
	echo "Packaging $(WHY_UNI_PACKAGE)..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control
	cp uni/why-uni_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp uni/why-uni_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm

WHY_UNI_NVIDIA_PACKAGE = uni/why-uni-nvidia_all

$(WHY_UNI_NVIDIA_PACKAGE): uni/why-uni-nvidia_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

WHY_WRITE_PACKAGE = why-write_all

$(WHY_WRITE_PACKAGE): uni/why-write_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

