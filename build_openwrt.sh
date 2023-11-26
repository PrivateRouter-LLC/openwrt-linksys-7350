#!/bin/bash

BASEDIR=$(realpath "$0" | xargs dirname)

OUTPUT="${BASEDIR}/images"
BUILD_VERSION="23.05.1"
BOARD_NAME="ramips"
BOARD_SUBNAME="mt7621"
BUILDER="https://downloads.openwrt.org/releases/${BUILD_VERSION}/targets/${BOARD_NAME}/${BOARD_SUBNAME}/openwrt-imagebuilder-${BUILD_VERSION}-${BOARD_NAME}-${BOARD_SUBNAME}.Linux-x86_64.tar.xz"
BUILDER_NAME="${BUILDER##*/}"
BUILDER_FOLDER="${BUILDER_NAME%.tar.xz}"
# KERNEL_PARTSIZE=200 #Kernel-Partitionsize in MB
# ROOTFS_PARTSIZE=5120 #Rootfs-Partitionsize in MB

# Search for any file named "openwrt-imagebuilder*" but not ${BUILDER_NAME} and delete it
find "${BASEDIR}" -maxdepth 1 -type f -name "openwrt-imagebuilder*" ! -name "${BUILDER_NAME}" -exec rm -rf {} \;

# Search for any directory containing the name openwrt-imagebuilder, named different than "${BUILDER##*/}" and delete it
find "${BASEDIR}" -maxdepth 1 -type d -name "openwrt-imagebuilder*" ! -name "${BUILDER_FOLDER}" -exec rm -rf {} \;

# download image builder if needed
if [ ! -f "${BUILDER_NAME}" ]; then
	wget "$BUILDER"
fi

# extract image builder if needed
if [ ! -d "${BUILDER_FOLDER}" ] && [ -f "${BUILDER_NAME}" ]; then
      tar xJvf "${BUILDER_NAME}"
fi

[ -d "${OUTPUT}" ] && { rm -rf "${OUTPUT}"; mkdir "${OUTPUT}"; } || { mkdir "${OUTPUT}"; }

cd "${BUILDER_FOLDER}"

make clean

# Packages are added if no prefix is given, '-packaganame' does not integrate a package
# sed -i "s/CONFIG_TARGET_KERNEL_PARTSIZE=.*/CONFIG_TARGET_KERNEL_PARTSIZE=$KERNEL_PARTSIZE/g" .config
# sed -i "s/CONFIG_TARGET_ROOTFS_PARTSIZE=.*/CONFIG_TARGET_ROOTFS_PARTSIZE=$ROOTFS_PARTSIZE/g" .config

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    make image PROFILE="linksys_e7350" \
           PACKAGES="block-mount kmod-fs-ext4 kmod-usb-storage blkid mount-utils swap-utils e2fsprogs fdisk luci dnsmasq bash" \
      FILES="${BASEDIR}/files/" \
      BIN_DIR="${OUTPUT}"

