FRITURE_VERSION = 0.51
FRITURE_PACKAGE = friture_all

friture_all: friture_control
	echo "Packaging $@..."
	rm -rf $@
	rm -rf friture
	git clone --depth 1 --branch v$(FRITURE_VERSION) https://github.com/tlecomte/friture.git
	mkdir -p $@/usr/share/friture
	cp -r ./friture/* $@/usr/share/friture
	cp friture_requirements.txt $@/usr/share/friture/requirements.txt
	mkdir -p $@/usr/bin/
	cp friture.sh $@/usr/bin/friture
	chmod +x $@/usr/bin/friture
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control
	cp friture_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	rm -rf friture

