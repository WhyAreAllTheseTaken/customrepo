LTSA_PACKAGE = ltsa_all

ltsa_all: ltsa_control
	echo "Packaging $@..."
	wget --show-progress -O ltsatool.zip https://www.doc.ic.ac.uk/~jnm/book/ltsa/ltsatool.zip
	rm -rf ltsatool
	unzip ltsatool.zip
	mkdir -p $@/usr/share/
	mkdir -p $@/usr/bin/
	cp -r ./ltsatool $@/usr/share/
	cp ./ltsa $@/usr/bin/
	chmod +x $@/usr/bin/ltsa
	mkdir -p $@/DEBIAN
	cp ltsa_control $@/DEBIAN/control
	rm -rf ltsatool

