$(REPO)/discord_%_amd64.deb:
	echo "Downloading $@..."
	-wget --show-progress -O $@ https://stable.dl2.discordapp.net/apps/linux/$*/discord-$*.deb
	if [[ ! -s $@ ]]; then\
		rm $@;\
	fi

discord_versions: $(REPO)/discord_0.0.89_amd64.deb \
	$(REPO)/discord_0.0.90_amd64.deb \
	$(REPO)/discord_0.0.91_amd64.deb \
	$(REPO)/discord_0.0.92_amd64.deb

