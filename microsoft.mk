MS_PACKAGE = packages-microsoft-prod_all

$(REPO)/packages-microsoft-prod_all.deb:
	echo "Downloading $@..."
	wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O $@

$(REPO)/code_amd64.deb:
	echo "Downloading $@..."
	wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O $@

