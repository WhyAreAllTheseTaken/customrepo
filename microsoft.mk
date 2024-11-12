MS_VERSION = 1.1
MS_REVISION = debian12
MS_PACKAGE = packages-microsoft-prod_$(MS_VERSION)-$(MS_REVISION)

$(REPO)/$(MS_PACKAGE).deb:
	wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O $(REPO)/$(MS_PACKAGE).deb

