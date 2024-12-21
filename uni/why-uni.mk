WHY_UNI_VERSION = 0.10.0
WHY_UNI_REVISION = 2
WHY_UNI_PACKAGE = why-uni_$(WHY_UNI_VERSION)-$(WHY_UNI_REVISION)_all

$(REPO)/$(WHY_UNI_PACKAGE).deb:
	echo "Packaging $(WHY_UNI_PACKAGE)..."
	rm -rf $(WHY_UNI_PACKAGE)
	mkdir -p $(WHY_UNI_PACKAGE)/DEBIAN
	cp uni/why-uni_control $(WHY_UNI_PACKAGE)/DEBIAN/control
	cp uni/why-uni_postinst.sh $(WHY_UNI_PACKAGE)/DEBIAN/postinst
	chmod +x $(WHY_UNI_PACKAGE)/DEBIAN/postinst
	cp uni/why-uni_prerm.sh $(WHY_UNI_PACKAGE)/DEBIAN/prerm
	chmod +x $(WHY_UNI_PACKAGE)/DEBIAN/prerm
	dpkg-deb --build $(WHY_UNI_PACKAGE)
	mv $(WHY_UNI_PACKAGE).deb $(REPO)
	rm -rf $(WHY_UNI_PACKAGE)

WHY_UNI_NVIDIA_VERSION = 0.10.0
WHY_UNI_NVIDIA_REVISION = 3
WHY_UNI_NVIDIA_PACKAGE = why-uni-nvidia_$(WHY_UNI_NVIDIA_VERSION)-$(WHY_UNI_NVIDIA_REVISION)_all

$(REPO)/$(WHY_UNI_NVIDIA_PACKAGE).deb:
	echo "Packaging $(WHY_UNI_NVIDIA_PACKAGE)..."
	rm -rf $(WHY_UNI_NVIDIA_PACKAGE)
	mkdir -p $(WHY_UNI_NVIDIA_PACKAGE)/DEBIAN
	cp uni/why-uni-nvidia_control $(WHY_UNI_NVIDIA_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_UNI_NVIDIA_PACKAGE)
	mv $(WHY_UNI_NVIDIA_PACKAGE).deb $(REPO)
	rm -rf $(WHY_UNI_NVIDIA_PACKAGE)

WHY_WRITE_VERSION = 0.0.0
WHY_WRITE_REVISION = 2
WHY_WRITE_PACKAGE = why-write_$(WHY_WRITE_VERSION)-$(WHY_WRITE_REVISION)_all

$(REPO)/$(WHY_WRITE_PACKAGE).deb:
	echo "Packaging $(WHY_WRITE_PACKAGE)..."
	rm -rf $(WHY_WRITE_PACKAGE)
	mkdir -p $(WHY_WRITE_PACKAGE)/DEBIAN
	cp uni/why-write_control $(WHY_WRITE_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(WHY_WRITE_PACKAGE)
	mv $(WHY_WRITE_PACKAGE).deb $(REPO)
	rm -rf $(WHY_WRITE_PACKAGE)

