$(REPO)/discord_%_amd64.deb:
	echo "Downloading $@..."
	-wget --show-progress -O $@ https://stable.dl2.discordapp.net/apps/linux/$*/discord-$*.deb
	if [[ ! -s $@ ]]; then\
		rm $@;\
	fi

discord_versions: $(REPO)/discord_0.0.104_amd64.deb \
	$(REPO)/discord_0.0.105_amd64.deb \
	$(REPO)/discord_0.0.106_amd64.deb \
	$(REPO)/discord_0.0.107_amd64.deb \
	$(REPO)/discord_0.0.108_amd64.deb \
	$(REPO)/discord_0.0.109_amd64.deb

