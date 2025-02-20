$(REPO)/discord_%_amd64.deb:
	echo "Downloading $@..."
	-wget --show-progress -O $@ https://stable.dl2.discordapp.net/apps/linux/$*/discord-$*.deb
	if [[ ! -s $@ ]]; then\
		rm $@;\
	fi

discord_versions: $(REPO)/discord_0.0.85_amd64.deb \
	$(REPO)/discord_0.0.86_amd64.deb \
	$(REPO)/discord_0.0.87_amd64.deb \
	$(REPO)/discord_0.0.88_amd64.deb

