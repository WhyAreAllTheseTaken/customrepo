$(REPO)/%.deb: %
	-rm $@
	dpkg-deb --build $<
	mv $<.deb $(REPO)

