MINECRAFT_VERSION = 0.0.0
MINECRAFT_REVISION = 1
MINECRAFT_PACKAGE = minecraft_$(MINECRAFT_VERSION)-$(MINECRAFT_REVISION)_all

$(REPO)/$(MINECRAFT_PACKAGE).deb:
	echo "Downloading $(MINECRAFT_PACKAGE)..."
	wget https://launcher.mojang.com/download/Minecraft.deb -O $(REPO)/$(MINECRAFT_PACKAGE).deb


