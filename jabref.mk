JABREF_VERSION = 5.15
JABREF_PACKAGE = jabref_$(JABREF_VERSION)_amd64

$(REPO)/jabref_%_amd64.deb:
	echo "Downloading $(JABREF_PACKAGE)..."
	wget --show-progress -O $@ https://github.com/JabRef/jabref/releases/download/v$*/jabref_$*_amd64.deb

