JDK_VERSION = 23
JDK_REVISION = 8
JDK_PACKAGE = openjdk-latest-jdk_$(JDK_VERSION)-$(JDK_REVISION)

$(REPO)/$(JDK_PACKAGE).deb:
	echo "Packaging $(JDK_PACKAGE)..."
	mkdir -p $(JDK_PACKAGE)/DEBIAN
	cp jdk_control $(JDK_PACKAGE)/DEBIAN/control
	dpkg-deb --build $(JDK_PACKAGE)
	mv $(JDK_PACKAGE).deb $(REPO)
	rm -rf $(JDK_PACKAGE)

JDK23_VERSION = 23
JDK23_BUILD = 37
JDK23_REVISION = 8
JDK23_PACKAGE = openjdk-23-jdk_$(JDK23_VERSION)+$(JDK23_BUILD)-$(JDK23_REVISION)_amd64

$(REPO)/$(JDK23_PACKAGE).deb:
	echo "Packaging $(JDK23_PACKAGE)..."
	wget --show-progress -O openjdk-$(JDK23_VERSION).tar.gz https://download.java.net/java/GA/jdk23/3c5b90190c68498b986a97f276efd28a/37/GPL/openjdk-23_linux-x64_bin.tar.gz
	mkdir -p $(JDK23_PACKAGE)/usr/lib/jvm
	tar -xzf openjdk-$(JDK23_VERSION).tar.gz --directory $(JDK23_PACKAGE)/usr/lib/jvm
	mkdir -p $(JDK23_PACKAGE)/DEBIAN
	cp jdk23_control $(JDK23_PACKAGE)/DEBIAN/control
	sed -i "s/%arch%/amd64/g" $(JDK23_PACKAGE)/DEBIAN/control
	cp jdk23_postinst.sh $(JDK23_PACKAGE)/DEBIAN/postinst
	chmod +x $(JDK23_PACKAGE)/DEBIAN/postinst
	cp jdk23_prerm.sh $(JDK23_PACKAGE)/DEBIAN/prerm
	chmod +x $(JDK23_PACKAGE)/DEBIAN/prerm
	dpkg-deb --build $(JDK23_PACKAGE)
	mv $(JDK23_PACKAGE).deb $(REPO)
	rm -rf openjdk-$(JDK23_VERSION).tar.gz
	rm -rf $(JDK23_PACKAGE)

JDK21_VERSION = 21.0.2
JDK21_BUILD = 13
JDK21_REVISION = 8
JDK21_PACKAGE = openjdk-21-jdk_$(JDK21_VERSION)+$(JDK21_BUILD)-$(JDK21_REVISION)_amd64

$(REPO)/$(JDK21_PACKAGE).deb:
	echo "Packaging $(JDK21_PACKAGE)..."
	wget --show-progress -O openjdk-$(JDK21_VERSION).tar.gz https://download.java.net/java/GA/jdk21.0.2/f2283984656d49d69e91c558476027ac/13/GPL/openjdk-21.0.2_linux-x64_bin.tar.gz
	mkdir -p $(JDK21_PACKAGE)/usr/lib/jvm
	tar -xzf openjdk-$(JDK21_VERSION).tar.gz --directory $(JDK21_PACKAGE)/usr/lib/jvm
	mkdir -p $(JDK21_PACKAGE)/DEBIAN
	cp jdk21_control $(JDK21_PACKAGE)/DEBIAN/control
	sed -i "s/%arch%/amd64/g" $(JDK21_PACKAGE)/DEBIAN/control
	cp jdk21_postinst.sh $(JDK21_PACKAGE)/DEBIAN/postinst
	chmod +x $(JDK21_PACKAGE)/DEBIAN/postinst
	cp jdk21_prerm.sh $(JDK21_PACKAGE)/DEBIAN/prerm
	chmod +x $(JDK21_PACKAGE)/DEBIAN/prerm
	dpkg-deb --build $(JDK21_PACKAGE)
	mv $(JDK21_PACKAGE).deb $(REPO)
	rm -rf openjdk-$(JDK21_VERSION).tar.gz
	rm -rf $(JDK21_PACKAGE)

JDK23_PACKAGE_ARM64 = openjdk-23-jdk_$(JDK23_VERSION)+$(JDK23_BUILD)-$(JDK23_REVISION)_arm64

$(REPO)/$(JDK23_PACKAGE_ARM64).deb:
	echo "Packaging $(JDK23_PACKAGE_ARM64)..."
	wget --show-progress -O openjdk-$(JDK23_VERSION)_arm64.tar.gz https://download.java.net/java/GA/jdk23/3c5b90190c68498b986a97f276efd28a/37/GPL/openjdk-23_linux-aarch64_bin.tar.gz
	mkdir -p $(JDK23_PACKAGE_ARM64)/usr/lib/jvm
	tar -xzf openjdk-$(JDK23_VERSION)_arm64.tar.gz --directory $(JDK23_PACKAGE_ARM64)/usr/lib/jvm
	mkdir -p $(JDK23_PACKAGE_ARM64)/DEBIAN
	cp jdk23_control $(JDK23_PACKAGE_ARM64)/DEBIAN/control
	sed -i "s/%arch%/arm64/g" $(JDK23_PACKAGE_ARM64)/DEBIAN/control
	cp jdk23_postinst.sh $(JDK23_PACKAGE_ARM64)/DEBIAN/postinst
	chmod +x $(JDK23_PACKAGE_ARM64)/DEBIAN/postinst
	cp jdk23_prerm.sh $(JDK23_PACKAGE_ARM64)/DEBIAN/prerm
	chmod +x $(JDK23_PACKAGE_ARM64)/DEBIAN/prerm
	dpkg-deb --build $(JDK23_PACKAGE_ARM64)
	mv $(JDK23_PACKAGE_ARM64).deb $(REPO)
	rm -rf openjdk-$(JDK23_VERSION)_arm64.tar.gz
	rm -rf $(JDK23_PACKAGE_ARM64)

JDK21_PACKAGE_ARM64 = openjdk-21-jdk_$(JDK21_VERSION)+$(JDK21_BUILD)-$(JDK21_REVISION)_arm64

$(REPO)/$(JDK21_PACKAGE_ARM64).deb:
	echo "Packaging $(JDK21_PACKAGE_ARM64)..."
	wget --show-progress -O openjdk-$(JDK21_VERSION)_arm64.tar.gz https://download.java.net/java/GA/jdk21.0.2/f2283984656d49d69e91c558476027ac/13/GPL/openjdk-21.0.2_linux-aarch64_bin.tar.gz 
	mkdir -p $(JDK21_PACKAGE_ARM64)/usr/lib/jvm
	tar -xzf openjdk-$(JDK21_VERSION)_arm64.tar.gz --directory $(JDK21_PACKAGE_ARM64)/usr/lib/jvm
	mkdir -p $(JDK21_PACKAGE_ARM64)/DEBIAN
	cp jdk21_control $(JDK21_PACKAGE_ARM64)/DEBIAN/control
	sed -i "s/%arch%/arm64/g" $(JDK21_PACKAGE_ARM64)/DEBIAN/control
	cp jdk21_postinst.sh $(JDK21_PACKAGE_ARM64)/DEBIAN/postinst
	chmod +x $(JDK21_PACKAGE_ARM64)/DEBIAN/postinst
	cp jdk21_prerm.sh $(JDK21_PACKAGE_ARM64)/DEBIAN/prerm
	chmod +x $(JDK21_PACKAGE_ARM64)/DEBIAN/prerm
	dpkg-deb --build $(JDK21_PACKAGE_ARM64)
	mv $(JDK21_PACKAGE_ARM64).deb $(REPO)
	rm -rf openjdk-$(JDK21_VERSION)_arm64.tar.gz
	rm -rf $(JDK21_PACKAGE_ARM64)

