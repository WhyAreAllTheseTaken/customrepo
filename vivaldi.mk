VIVALDI_VERSION = 6.9.3447.51
VIVALDI_REVISION = 1
VIVALDI_PACKAGE = vivaldi-stable_$(VIVALDI_VERSION)-$(VIVALDI_REVISION)_amd64

$(REPO)/vivaldi-stable_%_amd64.deb:
	echo "Downloading $@..."
	wget --show-progress -O $@ "https://downloads.vivaldi.com/stable/vivaldi-stable_$*_amd64.deb"

