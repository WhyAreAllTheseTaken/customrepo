why-world_all: dev/why-world_control
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	cp $< $@/DEBIAN/control

