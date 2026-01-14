$(REPO)/discord_%_amd64.deb:
	echo "Downloading $@..."
	-wget --show-progress -O $@ https://stable.dl2.discordapp.net/apps/linux/$*/discord-$*.deb
	if [[ ! -s $@ ]]; then\
		rm $@;\
	fi

discord_versions: $(REPO)/discord_0.0.119_amd64.deb \
	$(REPO)/discord_0.0.120_amd64.deb \
	$(REPO)/discord_0.0.121_amd64.deb \
	$(REPO)/discord_0.0.122_amd64.deb

