JDK_VERSION = 23
JDK_REVISION = 6
JDK_PACKAGE = openjdk-latest-jdk_$(JDK_VERSION)-$(JDK_REVISION)

$(REPO)/$(JDK_PACKAGE).deb:
	wget --show-progress -O openjdk-$(JDK_VERSION).tar.gz https://download.java.net/java/GA/jdk23/3c5b90190c68498b986a97f276efd28a/37/GPL/openjdk-23_linux-x64_bin.tar.gz
	mkdir -p $(JDK_PACKAGE)/usr/lib/jvm
	tar -xzf openjdk-$(JDK_VERSION).tar.gz --directory $(JDK_PACKAGE)/usr/lib/jvm
	mkdir -p $(JDK_PACKAGE)/DEBIAN
	cp jdk_control $(JDK_PACKAGE)/DEBIAN/control
	cp jdk_postinst.sh $(JDK_PACKAGE)/DEBIAN/postinst
	chmod +x $(JDK_PACKAGE)/DEBIAN/postinst
	cp jdk_prerm.sh $(JDK_PACKAGE)/DEBIAN/prerm
	chmod +x $(JDK_PACKAGE)/DEBIAN/prerm
	dpkg-deb --build $(JDK_PACKAGE)
	mv $(JDK_PACKAGE).deb $(REPO)
	rm -rf openjdk-$(JDK_VERSION).tar.gz
	rm -rf $(JDK_PACKAGE)

