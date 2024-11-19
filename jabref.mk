JABREF_VERSION = 5.15
JABREF_PACKAGE = jabref_$(JABREF_VERSION)

$(REPO)/$(JABREF_PACKAGE).deb:
	echo "Downloading $(JABREF_PACKAGE)..."
	wget --show-progress -O $(REPO)/$(JABREF_PACKAGE).deb https://github.com/JabRef/jabref/releases/download/v$(JABREF_VERSION)/jabref_$(JABREF_VERSION)_amd64.deb

