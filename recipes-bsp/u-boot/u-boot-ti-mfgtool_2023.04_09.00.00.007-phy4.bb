SUMMARY = "Produces a Manufacturing Tool compatible U-Boot"
DESCRIPTION = "U-Boot recipe that produces a Manufacturing Tool compatible \
binary to be used in updater environment"

require dynamic-layers/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti_v2023.04_09.00.00.007-phy4.bb

FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-ti:"

include recipes-bsp/u-boot/u-boot-lmp-common.inc

PACKAGECONFIG[optee] = "TEE=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/tee-pager_v2.bin,,${PREFERRED_PROVIDER_virtual/optee-os}"

# Environment config is not required for mfgtool
SRC_URI:remove = "file://fw_env.config"
SRC_URI:remove = "file://lmp.cfg"

SRC_URI:append = " \
    file://0001-phycore_am62x-add-DFU-env-settings.patch \
    file://0001-arm-dts-am625-phyboard-lyra-rdk-enable-usb0-for-SPL-.patch \
    file://lmp-mfgtool.cfg \
    file://dfu.cfg \
"
