sysroot:
	$(STEP) "musl-1.1.16"
	$(EXTRACT) $(SOURCES_DIR)/musl-1.1.16.tar.gz $(BUILD_DIR)
	( cd $(BUILD_DIR)/musl-1.1.16 && \
	./configure \
  CROSS_COMPILE=$(TOOLS_DIR)/bin/$(CONFIG_TARGET)- \
  --prefix=/ \
  --target=$(CONFIG_TARGET) )
	make -C $(BUILD_DIR)/musl-1.1.16
	DESTDIR=$(TOOLS_DIR)/$(CONFIG_TARGET) make install -C $(BUILD_DIR)/musl-1.1.16
	rm -rf $(BUILD_DIR)/musl-1.1.16
