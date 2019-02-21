include settings.mk

.PHONY: all toolchain system image clean

help:
	$(SCRIPTS_DIR)/help.sh

all:
	make clean toolchain system image

toolchain:
	rm -rf $(TOOLS_DIR)
	mkdir -pv $(BUILD_DIR)
	mkdir -p $(TOOLS_DIR)/$(CONFIG_TARGET)
	ln -sfv . $(TOOLS_DIR)/$(CONFIG_TARGET)/usr
	make sysroot -C $(PACKAGES_DIR)/linux
	make toolchain -C $(PACKAGES_DIR)/binutils
	make toolchain-static -C $(PACKAGES_DIR)/gcc
	make sysroot -C $(PACKAGES_DIR)/musl
	make toolchain-final -C $(PACKAGES_DIR)/gcc


system:

image:
	$(SCRIPTS_DIR)/image.sh

clean:
	rm -rf out

run:
	qemu-img create -f qcow2 $(IMAGES_DIR)/qemu-hda.img 300M
	qemu-system-x86_64 -m 512M -hda $(IMAGES_DIR)/qemu-hda.img -cdrom $(IMAGES_DIR)/$(CONFIG_ISO_FILENAME) -boot d -vga std

run-usb:
	qemu-system-x86_64 -m 512M -usb $(IMAGES_DIR)/$(CONFIG_ISO_FILENAME) -boot d -vga std

run-hdd:
	qemu-system-x86_64 -m 512M -hda $(IMAGES_DIR)/qemu-hda.img -boot d -vga std -net user,hostfwd=tcp::8021-:21,hostfwd=tcp::8022-:22,hostfwd=tcp::9091-:9091 -net nic

flash:
	sudo python2 $(SCRIPTS_DIR)/image-usb-stick.py $(IMAGES_DIR)/$(CONFIG_ISO_FILENAME) && sudo -k

download:
	wget -c -i wget-list -P $(SOURCES_DIR)
