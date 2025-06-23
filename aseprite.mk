ASEPRITE_VERSION=1.3.14

skia-release.zip:
	wget --show-progress -O $@ "https://github.com/aseprite/skia/releases/download/m124-08a5439a6b/Skia-Linux-Release-x64.zip"

skia-release: skia-release.zip
	mkdir -p $@
	unzip $< -d $@

aseprite:
	git clone --depth 1 --branch v$(ASEPRITE_VERSION) https://github.com/aseprite/aseprite.git
	cd aseprite && git submodule update --init --recursive

aseprite_done2: aseprite skia-release
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
	  -DSKIA_DIR=/usr/customrepo/skia-release \
	  -DSKIA_LIBRARY_DIR=/usr/customrepo/skia-release/out/Release-x64 \
	  -DSKIA_LIBRARY=/usr/customrepo/skia-release/out/Release-x64/libskia.a \
	  -G Ninja \
	  ..
	export CC=clang; \
	export CXX=clang++; \
	cd aseprite/build && ninja aseprite
	touch aseprite_done2

aseprite_$(ARCH): aseprite_control aseprite_done2
	echo "Packaging $@..."
	rm -rf $@
	mkdir -p $@/DEBIAN
	mkdir -p $@/opt/aseprite/
	cp -rv aseprite/build/bin/* $@/opt/aseprite/
	cp $< $@/DEBIAN/control
	sed -i "s/%version%/$(ASEPRITE_VERSION)/g" $@/DEBIAN/control
	sed -i "s/%arch%/$(ARCH)/g" $@/DEBIAN/control
	cp aseprite_postinst.sh $@/DEBIAN/postinst
	chmod +x $@/DEBIAN/postinst
	cp aseprite_prerm.sh $@/DEBIAN/prerm
	chmod +x $@/DEBIAN/prerm

