MINECRAFT_VERSION = 2.1.3
MINECRAFT_REVISION = 1
MINECRAFT_PACKAGE = minecraft_$(MINECRAFT_VERSION)-$(MINECRAFT_REVISION)_all

$(REPO)/$(MINECRAFT_PACKAGE).deb:
	echo "Downloading $(MINECRAFT_PACKAGE)..."
	wget https://launcher.mojang.com/download/Minecraft.deb -O $@

MULTIMC_VERSION = 1.6-1
MULTIMC_PACKAGE = multimc_$(MULTIMC_VERSION)_amd64

$(REPO)/multimc_%_amd64.deb:
	echo "Downloading $(MULTIMC_PACKAGE)..."
	wget https://files.multimc.org/downloads/multimc_%.deb -O $@

