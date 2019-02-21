-include config.mk

export PARALLEL_JOBS := $(shell cat /proc/cpuinfo | grep cores | wc -l)
export WORKSPACE_DIR := $(shell cd "$(dirname "$0")" && pwd)
export SOURCES_DIR := $(WORKSPACE_DIR)/sources
export SCRIPTS_DIR := $(WORKSPACE_DIR)/scripts
export PACKAGES_DIR := $(WORKSPACE_DIR)/packages
export OUTPUT_DIR := $(WORKSPACE_DIR)/out
export BUILD_DIR := $(OUTPUT_DIR)/build
export TOOLS_DIR := $(OUTPUT_DIR)/tools
export SYSROOT_DIR := $(TOOLS_DIR)/$(CONFIG_TARGET)/sysroot
export ROOTFS_DIR := $(OUTPUT_DIR)/rootfs
export IMAGES_DIR := $(OUTPUT_DIR)/images
export KERNEL_DIR := $(OUTPUT_DIR)/kernel
export STEP := $(SCRIPTS_DIR)/step.sh
export EXTRACT := $(SCRIPTS_DIR)/extract.sh
export LC_ALL := POSIX
export PATH := "$(TOOLS_DIR)/bin:/bin:$(PATH)"
export CONFIG_SITE := /dev/null
unexport CFLAGS
