export CONFIG_TARGET = x86_64-linux-musl
export CONFIG_HOST = $(shell uname -m)-cross-linux-gnu
export CONFIG_LINUX_ARCH = x86_64
export CONFIG_LINUX_KERNEL_DEFCONFIG = x86_64_defconfig
export CONFIG_ISO_FILENAME = QNAS-1.0.0-Absinthe-x86_64.iso
# Strip binaries and delete manpages
export CONFIG_STRIP_AND_DELETE_DOCS = 1
# Root user password
export CONFIG_ROOT_PASSWD = qnas
# Hostname
export CONFIG_HOSTNAME = qnas
# Local timezone
export CONFIG_LOCAL_TIMEZONE = Asia/Seoul
