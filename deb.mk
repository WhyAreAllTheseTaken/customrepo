$(REPO)/%.deb: %
	-rm $@ &> /dev/null
	if [[ ! -f $</DEBIAN/control ]]; then\
		rm -rf $<;\
	fi
	dpkg-deb --root-owner-group --build $<
	mv $<.deb $(REPO)

