ASEPRITE_VERSION=1.2.40

depot_tools:
	git clone --depth 1 https://chromium.googlesource.com/chromium/tools/depot_tools.git

depot_tools_done: depot_tools
	echo "Setting up depot tools..."
	cd depot_tools && ./ensure_bootstrap

skia:
	git clone --depth 1 --branch aseprite-m102 https://github.com/aseprite/skia.git

skia_done: skia depot_tools_done
	echo "Compiling skia..."
	export CC=clang; \
	export CXX=clang++; \
	export PATH="depot_tools:$${PATH}"; \
	echo $$PATH; \
	cd skia; \
	python3 tools/git-sync-deps; \
	gn gen out/Release-x64 --args='is_debug=false is_official_build=true skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false skia_use_sfntly=false skia_use_freetype=true skia_use_harfbuzz=true skia_pdf_subset_harfbuzz=true skia_use_system_freetype2=false skia_use_system_harfbuzz=false cc="clang" cxx="clang++" extra_cflags_cc=["-stdlib=libc++"] extra_ldflags=["-stdlib=libc++"]'; \
	ninja -C out/Release-x64 skia modules
	touch skia_done

aseprite:
	git clone --depth 1 --branch v$(ASEPRITE_VERSION) https://github.com/aseprite/aseprite.git
	cd aseprite && git submodule update --init --recursive

aseprite/build: aseprite skia_done
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

