toolchain:
	$(STEP) "Binutils 2.27"
	$(EXTRACT) $(SOURCES_DIR)/binutils-2.27.tar.bz2 $(BUILD_DIR)
	mkdir -pv $(BUILD_DIR)/binutils-2.27/binutils-build
	( cd $(BUILD_DIR)/binutils-2.27/binutils-build && \
	$(BUILD_DIR)/binutils-2.27/configure \
	--prefix=$(TOOLS_DIR) \
   --target=$(CONFIG_TARGET) \
   --with-sysroot=$(TOOLS_DIR)/$(CONFIG_TARGET) \
   --disable-nls \
   --disable-multilib )
	make -j$(PARALLEL_JOBS) configure-host -C $(BUILD_DIR)/binutils-2.27/binutils-build
	make -j$(PARALLEL_JOBS) -C $(BUILD_DIR)/binutils-2.27/binutils-build
	make -j$(PARALLEL_JOBS) install -C $(BUILD_DIR)/binutils-2.27/binutils-build
	rm -rf $(BUILD_DIR)/binutils-2.27
