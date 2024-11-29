VIVALDI_VERSION = 6.9.3447.51
VIVALDI_REVISION = 1
VIVALDI_PACKAGE = vivaldi-stable_$(VIVALDI_VERSION)-$(VIVALDI_REVISION)_amd64

$(REPO)/$(VIVALDI_PACKAGE).deb:
	echo "Downloading $(VIVALDI_PACKAGE)..."
	wget --show-progress -O $(REPO)/$(VIVALDI_PACKAGE).deb "https://downloads.vivaldi.com/stable/vivaldi-stable_6.9.3447.51-1_amd64.deb"

