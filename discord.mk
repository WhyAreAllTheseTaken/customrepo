DISCORD_VERSION = 0.0.78
DISCORD_PACKAGE = discord_$(DISCORD_VERSION)_amd64

$(REPO)/discord_%_amd64.deb:
	echo "Downloading $@..."
	wget --show-progress -O $@ https://stable.dl2.discordapp.net/apps/linux/$*/discord-$*.deb

