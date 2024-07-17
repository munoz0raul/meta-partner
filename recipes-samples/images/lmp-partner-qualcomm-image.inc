# Additions for qcom partner image

CORE_IMAGE_BASE_INSTALL:append:qcom = " \
    packagegroup-qcom-core \
    packagegroup-qcom-initscripts \
    packagegroup-qcom-perf \
    packagegroup-qcom-ppat \
    packagegroup-qcom-data \
    wlan-conf \
    cld80211-lib \
    common-tools \
    ath6kl-utils \
    ftm \
    kernel-module-wlan-platform \
    kernel-module-qcacld-wlan \
    packagegroup-qcom-securemsm \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${CORE_IMAGE_BASE_INSTALL_WAYLAND}', '', d)} \
"

CORE_IMAGE_BASE_INSTALL:append:qcom = " \
    packagegroup-qcom-audio \
    packagegroup-qcom-bluetooth \
    packagegroup-qcom-iot-base-utils \
"

# qcom uses weston-launch (via init_display.service)
CORE_IMAGE_BASE_INSTALL:remove:qcom = " \
    weston-init \
"
CORE_IMAGE_BASE_INSTALL_WAYLAND ?= ""
CORE_IMAGE_BASE_INSTALL_WAYLAND:qcom = " \
    packagegroup-qcom-camera \
    packagegroup-qcom-display \
    packagegroup-qcom-fastcv \
    packagegroup-qcom-graphics \
    packagegroup-qcom-sensors \
    packagegroup-qcom-video \
    packagegroup-qcom-iot-base-utils \
"
CORE_IMAGE_BASE_INSTALL_WAYLAND:append:qcm6490 = " \
    camera-server \
"
