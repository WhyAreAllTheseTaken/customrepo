JDK_PACKAGE = openjdk-latest-jdk_all

$(JDK_PACKAGE): dev/jdk_control
	echo "Packaging $@..."
	mkdir -p $@/DEBIAN
	cp dev/jdk_control $@/DEBIAN/control

JDK23_PACKAGE = openjdk-23-jdk_amd64
JDK21_PACKAGE = openjdk-21-jdk_amd64
JDK23_PACKAGE_ARM64 = openjdk-23-jdk_arm64
JDK21_PACKAGE_ARM64 = openjdk-21-jdk_arm64

openjdk-23-2_amd64.tar.gz:
	wget --show-progress -O $@ https://download.java.net/java/GA/jdk23/3c5b90190c68498b986a97f276efd28a/37/GPL/openjdk-23_linux-x64_bin.tar.gz

openjdk-23-2_arm64.tar.gz:
	wget --show-progress -O $@ https://download.java.net/java/GA/jdk23/3c5b90190c68498b986a97f276efd28a/37/GPL/openjdk-23_linux-aarch64_bin.tar.gz

openjdk-21.0.2_amd64.tar.gz:
	wget --show-progress -O $@ https://download.java.net/java/GA/jdk21.0.2/f2283984656d49d69e91c558476027ac/13/GPL/openjdk-21.0.2_linux-x64_bin.tar.gz

openjdk-21.0.2_arm64.tar.gz:
	wget --show-progress -O $@ https://download.java.net/java/GA/jdk23/3c5b90190c68498b986a97f276efd28a/37/GPL/openjdk-23_linux-aarch64_bin.tar.gz

openjdk-23-jdk_%: openjdk-23-2_%.tar.gz dev/jdk23_control 
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/lib/jvm
	tar -xzf $< --directory $@/usr/lib/jvm
	mkdir -p $@/DEBIAN
	cp dev/jdk23_control $@/DEBIAN/control
	sed -i "s/%arch%/amd64/g" $@/DEBIAN/control
	cp dev/jdk23_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp dev/jdk23_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm

openjdk-21-jdk_%: openjdk-21.0.2_%.tar.gz dev/jdk21_control 
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/lib/jvm
	tar -xzf $< --directory $@/usr/lib/jvm
	mkdir -p $@/DEBIAN
	cp dev/jdk21_control $@/DEBIAN/control
	sed -i "s/%arch%/amd64/g" $@/DEBIAN/control
	cp dev/jdk21_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp dev/jdk21_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm

