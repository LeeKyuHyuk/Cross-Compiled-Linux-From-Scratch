toolchain-static:
	$(STEP) "Gcc 6.2.0 - Static"
	$(EXTRACT) $(SOURCES_DIR)/gcc-6.2.0.tar.bz2 $(BUILD_DIR)
	$(EXTRACT) $(SOURCES_DIR)/mpfr-3.1.4.tar.bz2 $(BUILD_DIR)/gcc-6.2.0
	mv -v $(BUILD_DIR)/gcc-6.2.0/mpfr-3.1.4 $(BUILD_DIR)/gcc-6.2.0/mpfr
	$(EXTRACT) $(SOURCES_DIR)/gmp-6.1.1.tar.bz2 $(BUILD_DIR)/gcc-6.2.0
	mv -v $(BUILD_DIR)/gcc-6.2.0/gmp-6.1.1 $(BUILD_DIR)/gcc-6.2.0/gmp
	$(EXTRACT) $(SOURCES_DIR)/mpc-1.0.3.tar.gz $(BUILD_DIR)/gcc-6.2.0
	mv -v $(BUILD_DIR)/gcc-6.2.0/mpc-1.0.3 $(BUILD_DIR)/gcc-6.2.0/mpc
	mkdir -pv $(BUILD_DIR)/gcc-6.2.0/gcc-build
	( cd $(BUILD_DIR)/gcc-6.2.0/gcc-build && \
	$(BUILD_DIR)/gcc-6.2.0/configure \
	--prefix=$(TOOLS_DIR) \
 --build=$(CONFIG_HOST) \
 --host=$(CONFIG_HOST) \
 --target=$(CONFIG_TARGET) \
 --with-sysroot=$(TOOLS_DIR)/$(CONFIG_TARGET) \
 --disable-nls  \
 --disable-shared \
 --without-headers \
 --with-newlib \
 --disable-decimal-float \
 --disable-libgomp \
 --disable-libmudflap \
 --disable-libssp \
 --disable-libatomic \
 --disable-libquadmath \
 --disable-threads \
 --enable-languages=c \
 --disable-multilib )
	make -j$(PARALLEL_JOBS) all-gcc all-target-libgcc -C $(BUILD_DIR)/gcc-6.2.0/gcc-build
	make -j$(PARALLEL_JOBS) install-gcc install-target-libgcc -C $(BUILD_DIR)/gcc-6.2.0/gcc-build
	rm -rf $(BUILD_DIR)/gcc-6.2.0

toolchain-final:
	$(STEP) "Gcc 6.2.0 - Final"
	$(EXTRACT) $(SOURCES_DIR)/gcc-6.2.0.tar.bz2 $(BUILD_DIR)
	$(EXTRACT) $(SOURCES_DIR)/mpfr-3.1.4.tar.bz2 $(BUILD_DIR)/gcc-6.2.0
	mv -v $(BUILD_DIR)/gcc-6.2.0/mpfr-3.1.4 $(BUILD_DIR)/gcc-6.2.0/mpfr
	$(EXTRACT) $(SOURCES_DIR)/gmp-6.1.1.tar.bz2 $(BUILD_DIR)/gcc-6.2.0
	mv -v $(BUILD_DIR)/gcc-6.2.0/gmp-6.1.1 $(BUILD_DIR)/gcc-6.2.0/gmp
	$(EXTRACT) $(SOURCES_DIR)/mpc-1.0.3.tar.gz $(BUILD_DIR)/gcc-6.2.0
	mv -v $(BUILD_DIR)/gcc-6.2.0/mpc-1.0.3 $(BUILD_DIR)/gcc-6.2.0/mpc
	mkdir -pv $(BUILD_DIR)/gcc-6.2.0/gcc-build
	( cd $(BUILD_DIR)/gcc-6.2.0/gcc-build && \
	$(BUILD_DIR)/gcc-6.2.0/configure \
	--prefix=$(TOOLS_DIR) \
  --build=$(CONFIG_HOST) \
  --host=$(CONFIG_HOST) \
  --target=$(CONFIG_TARGET) \
  --with-sysroot=$(TOOLS_DIR)/$(CONFIG_TARGET) \
  --disable-nls \
  --enable-languages=c \
  --enable-c99 \
  --enable-long-long \
  --disable-libmudflap \
  --disable-multilib )
	make -j$(PARALLEL_JOBS) -C $(BUILD_DIR)/gcc-6.2.0/gcc-build
	make -j$(PARALLEL_JOBS) -C $(BUILD_DIR)/gcc-6.2.0/gcc-build
	rm -rf $(BUILD_DIR)/gcc-6.2.0
