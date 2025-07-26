skelfixer_all: skelfixer_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/usr/bin/
	cp skelfixer $@/usr/bin/skelfixer
	chmod +x $@/usr/bin/skelfixer
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

