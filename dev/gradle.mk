GRADLE_VERSION = 8.14.2
GRADLE_PACKAGE = gradle_all

gradle-%-bin.zip:
	wget --show-progress -O $@ "https://services.gradle.org/distributions/gradle-$*-bin.zip"

gradle-%: gradle-%-bin.zip
	mkdir -p $@
	unzip $<

gradle_all: dev/gradle_control gradle-$(GRADLE_VERSION)
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	mkdir -p $@/opt/gradle/
	cp -rv $(filter-out $<,$^) $@/opt/gradle/
	cp $< $@/DEBIAN/control
	sed -i "s/%version%/$(GRADLE_VERSION)/g" $@/DEBIAN/control
	cp dev/gradle_postinst.sh $@/DEBIAN/postinst
	sed -i "s/%version%/$(GRADLE_VERSION)/g" $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp dev/gradle_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm

