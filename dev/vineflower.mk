VINEFLOWER_VERSION = 1.11.1

vineflower-%.jar:
	echo "Downloading $@..."
	wget --show-progress -O $@ https://github.com/Vineflower/vineflower/releases/download/$*/vineflower-$*.jar

vineflower_all: dev/vineflower_control vineflower_$(VINEFLOWER_VERSION).jar
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	mkdir -p $@/usr/share/
	cp $(filter-out $<,$^) $@/usr/share/vineflower.jar
	chmod +x $@/usr/share/vineflower.jar
	cp $< $@/DEBIAN/control
	sed -i "s/%version%/$(VINEFLOWER_VERSION)/g" $@/DEBIAN/control
