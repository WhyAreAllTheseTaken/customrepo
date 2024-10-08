ONLYOFFICE_PACKAGE = onltoffice-desktopeditors_amd64

$(ONLYOFFICE_PACKAGE).deb:
	wget --show-progress -O $(ONLYOFFICE_PACKAGE).deb "https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb"

