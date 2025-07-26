MINECRAFT_VERSION = 2.1.3
MINECRAFT_REVISION = 1
MINECRAFT_PACKAGE = minecraft_$(MINECRAFT_VERSION)-$(MINECRAFT_REVISION)_all

$(REPO)/$(MINECRAFT_PACKAGE).deb:
	echo "Downloading $(MINECRAFT_PACKAGE)..."
	wget https://launcher.mojang.com/download/Minecraft.deb -O $@

libgdk-pixbuf2.0-0_all: libgdk_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

MULTIMC_VERSION = 1.6-1
MULTIMC_PACKAGE = multimc_$(MULTIMC_VERSION)_amd64

$(REPO)/multimc_%_amd64.deb:
	echo "Downloading $(MULTIMC_PACKAGE)..."
	wget https://files.multimc.org/downloads/multimc_$*.deb -O $@

FABRIC_VERSION = 1.0.1

fabric-installer_amd64: fabric_control fabric.sh
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/share/
	wget --show-progress -O $@/usr/share/fabric-installer.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/$(FABRIC_VERSION)/fabric-installer-$(FABRIC_VERSION).jar
	mkdir -p $@/usr/bin/
	cp fabric.sh $@/usr/bin/fabric-installer
	chmod +x $@/usr/bin/fabric-installer
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control
	sed -i "s/%version%/$(FABRIC_VERSION)/g" $@/DEBIAN/control

