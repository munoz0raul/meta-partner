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
    udev-rules-qcom \
    curl \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '${CORE_IMAGE_BASE_INSTALL_WAYLAND}', '', d)} \
"

CORE_IMAGE_BASE_INSTALL:append:qcom = " \
    packagegroup-qcom-audio \
    packagegroup-qcom-bluetooth \
    packagegroup-qcom-iot-base-utils \
"

CORE_IMAGE_BASE_INSTALL_WAYLAND ?= ""
CORE_IMAGE_BASE_INSTALL_WAYLAND:qcom = " \
    packagegroup-qcom-camera \
    packagegroup-qcom-display \
    packagegroup-qcom-fastcv \
    packagegroup-qcom-graphics \
    packagegroup-qcom-opencv \
    packagegroup-qcom-sensors \
    packagegroup-qcom-video \
    packagegroup-qcom-qim-product \
"
CORE_IMAGE_BASE_INSTALL_WAYLAND:append:qcm6490 = " \
    camera-server \
"

# Replace default LmP users param to include fio in additional groups
EXTRA_USERS_PARAMS = "\
groupadd ${LMP_USER}; \
useradd -p '${LMP_PASSWORD}' ${LMP_USER}; \
usermod -a -G sudo,users,audio,video,plugdev ${LMP_USER}; \
"
