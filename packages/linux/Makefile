sysroot:
	$(STEP) "Linux API Headers 4.9.22"
	$(EXTRACT) $(SOURCES_DIR)/linux-4.9.22.tar.xz $(BUILD_DIR)
	make -j$(PARALLEL_JOBS) ARCH=$(CONFIG_LINUX_ARCH) mrproper -C $(BUILD_DIR)/linux-4.9.22
	make -j$(PARALLEL_JOBS) ARCH=$(CONFIG_LINUX_ARCH) headers_check -C $(BUILD_DIR)/linux-4.9.22
	make -j$(PARALLEL_JOBS) ARCH=$(CONFIG_LINUX_ARCH) INSTALL_HDR_PATH=$(TOOLS_DIR)/$(CONFIG_TARGET) headers_install -C $(BUILD_DIR)/linux-4.9.22
	rm -rf $(BUILD_DIR)/linux-4.9.22
