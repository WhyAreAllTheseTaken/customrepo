ONLYOFFICE_PACKAGE = onltoffice-desktopeditors_amd64

$(REPO)/$(ONLYOFFICE_PACKAGE).deb:
	wget --show-progress -O $(REPO)/$(ONLYOFFICE_PACKAGE).deb "https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb"

