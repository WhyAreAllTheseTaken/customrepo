$(REPO)/discord_%_amd64.deb:
	echo "Downloading $@..."
	-wget --show-progress -O $@ https://stable.dl2.discordapp.net/apps/linux/$*/discord-$*.deb
	if [[ ! -s $@ ]]; then\
		rm $@;\
	fi

discord_versions: $(REPO)/discord_0.0.92_amd64.deb \
	$(REPO)/discord_0.0.93_amd64.deb \
	$(REPO)/discord_0.0.94_amd64.deb \
	$(REPO)/discord_0.0.95_amd64.deb

