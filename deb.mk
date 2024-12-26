$(REPO)/%.deb: %
	-@rm $@
	if [[ ! -f $</DEBIAN/control ]]; then\
		rm -rf $<;\
	fi
	dpkg-deb --build $<
	mv $<.deb $(REPO)

