$(REPO)/discord_%_amd64.deb:
	echo "Downloading $@..."
	-wget --show-progress -O $@ https://stable.dl2.discordapp.net/apps/linux/$*/discord-$*.deb
	if [[ ! -s $@ ]]; then\
		rm $@;\
	fi

discord_versions: $(REPO)/discord_0.0.123_amd64.deb \
	$(REPO)/discord_0.0.124_amd64.deb \
	$(REPO)/discord_0.0.125_amd64.deb \
	$(REPO)/discord_0.0.126_amd64.deb

