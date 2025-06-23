ASEPRITE_VERSION=1.2.40

skia.zip:
	wget --show-progress -O $@ "https://github.com/aseprite/skia/releases/download/m124-08a5439a6b/Skia-Linux-Debug-x64.zip"

skia: skia.zip
	mkdir -p $@
	unzip $< -d $@

aseprite:
	git clone --depth 1 --branch v$(ASEPRITE_VERSION) https://github.com/aseprite/aseprite.git
	cd aseprite && git submodule update --init --recursive

aseprite/build: aseprite skia
	echo "Compiling $@..."
	rm -rf $@
	mkdir $@
	export CC=clang; \
	export CXX=clang++; \
	cd aseprite/build && cmake \
	  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	  -DCMAKE_CXX_FLAGS:STRING=-stdlib=libc++ \
	  -DCMAKE_EXE_LINKER_FLAGS:STRING=-stdlib=libc++ \
	  -DLAF_BACKEND=skia \
	  -DSKIA_DIR=../../skia \
	  -DSKIA_LIBRARY_DIR=../../skia/out/Release-x64 \
	  -DSKIA_LIBRARY=../../skia/out/Release-x64/libskia.a \
	  -G Ninja \
	  ..
	export CC=clang; \
	export CXX=clang++; \
	cd aseprite/build && ninja aseprite

aseprite_$(ARCH): aseprite_control aseprite/build
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	mkdir -p $@/opt/aseprite/
	cp -rv $(filter-out $<,$^)/bin/* $@/opt/aseprite/
	cp $< $@/DEBIAN/control
	sed -i "s/%version%/$(ASEPRITE_VERSION)/g" $@/DEBIAN/control
	sed -i "s/%arch%/$(ARCH)/g" $@/DEBIAN/control
	cp aseprite_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp aseprite_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm

