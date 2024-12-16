MS_VERSION = 1.1
MS_REVISION = debian12
MS_PACKAGE = packages-microsoft-prod_$(MS_VERSION)-$(MS_REVISION)_all

$(REPO)/$(MS_PACKAGE).deb:
	echo "Downloading $(MS_PACKAGE)..."
	wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O $(REPO)/$(MS_PACKAGE).deb

