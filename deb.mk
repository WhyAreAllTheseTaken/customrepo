$(REPO)/%.deb: % %/DEBIAN/control
	-rm $@
	dpkg-deb --build $<
	mv $<.deb $(REPO)

