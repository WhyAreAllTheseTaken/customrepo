DISCORD_VERSION = 0.0.75
DISCORD_PACKAGE = discord_$(DISCORD_VERSION)

$(REPO)/$(DISCORD_PACKAGE).deb:
	echo "Downloading $(DISCORD_PACKAGE)..."
	wget --show-progress -O $(REPO)/$(DISCORD_PACKAGE).deb https://stable.dl2.discordapp.net/apps/linux/$(DISCORD_VERSION)/discord-$(DISCORD_VERSION).deb

