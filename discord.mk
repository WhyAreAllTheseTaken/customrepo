$(REPO)/discord_%_amd64.deb:
	echo "Downloading $@..."
	-wget --show-progress -O $@ https://stable.dl2.discordapp.net/apps/linux/$*/discord-$*.deb
	if [[ ! -s $@ ]]; then\
		rm $@;\
	fi

discord_versions: $(REPO)/discord_0.0.78_amd64.deb \
	$(REPO)/discord_0.0.79_amd64.deb \
	$(REPO)/discord_0.0.80_amd64.deb \
	$(REPO)/discord_0.0.81_amd64.deb \
	$(REPO)/discord_0.0.82_amd64.deb \
	$(REPO)/discord_0.0.83_amd64.deb \
	$(REPO)/discord_0.0.84_amd64.deb \
	$(REPO)/discord_0.0.85_amd64.deb

