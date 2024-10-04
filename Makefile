.PHONY: repo packages

repo: packages

include *.mk

packages: $(CPMV_PACKAGE).deb $(JDK_PACKAGE).deb $(LTSA_PACKAGE).deb nvim-linux64.deb $(PACKER_PACKAGE).deb

