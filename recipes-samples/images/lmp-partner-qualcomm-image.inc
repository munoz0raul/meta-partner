# Additions for qcom partner image

CORE_IMAGE_BASE_INSTALL:append:qcom = " \
    packagegroup-qcom-initscripts \
    wlan-conf \
    cld80211-lib \
    common-tools \
    ath6kl-utils \
    ftm \
    kernel-module-wlan-platform \
    kernel-module-qcacld-wlan \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${CORE_IMAGE_BASE_INSTALL_WAYLAND}', '', d)} \
"

# qcom uses weston-launch (via init_display.service)
CORE_IMAGE_BASE_INSTALL:remove:qcom = " \
    weston-init \
"
CORE_IMAGE_BASE_INSTALL_WAYLAND ?= ""
CORE_IMAGE_BASE_INSTALL_WAYLAND:qcom = " \
    packagegroup-qcom-display \
    packagegroup-qcom-fastcv \
    packagegroup-qcom-graphics \
    packagegroup-qcom-video \
    packagegroup-qcom-iot-base-utils \
"
