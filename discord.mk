DISCORD_VERSION = 0.0.71
DISCORD_PACKAGE = discord_$(DISCORD_VERSION)

$(DISCORD_PACKAGE).deb:
	wget --show-progress -O $(DISCORD_PACKAGE).deb https://stable.dl2.discordapp.net/apps/linux/$(DISCORD_VERSION)/discord-$(DISCORD_VERSION).deb

