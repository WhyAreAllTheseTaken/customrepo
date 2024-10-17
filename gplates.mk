GPLATES_VERSION = 2.5
GPLATES_PACKAGE = gplates_$(GPLATES_VERSION)_amd64
GPLATES_DIR = gplates_$(GPLATES_VERSION)

$(GPLATES_DIR)/BUILD.Linux:
	rm -rf $(GPLATES_DIR)
	git --depth 1 --branch GPlates-$(GPLATES_VERSION) "https://github.com/GPlates/GPlates.git" $(GPLATES_DIR)

$(GPLATES_DIR)/bin/gplates: $(GPLATES_DIR)/BUILD.Linux
	cd $(GPLATES_DIR) && cmake .
	cd $(GPLATES_DIR) && make

$(GPLATES_PACKAGE).deb: $(GPLATES_DIR)/bin/gplates
	cd $(GPLATES_DIR) && make package

