include recipes-kernel/linux/kmeta-linux-lmp-5.15.y.inc

LINUX_VERSION ?= "5.15.37"
KBRANCH = "mtk-v5.15-dev"
SRCREV_machine = "e07add83483251271d0a2d39bfbe5babe876227a"
SRCREV_meta = "${KERNEL_META_COMMIT}"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

SRC_URI = "${AIOT_BSP_URI}/linux.git;protocol=ssh;branch=${KBRANCH};name=machine; \
    ${KERNEL_META_REPO};protocol=${KERNEL_META_REPO_PROTOCOL};type=kmeta;name=meta;branch=${KERNEL_META_BRANCH};destsuffix=${KMETA} \
"

SRC_URI:append:i350-evk = " \
    file://i350-evk-standard.scc \
    file://i350-evk.scc \
    file://i350-evk.cfg \
"
SRC_URI:append:i1200-demo = " \
    file://i1200-demo-standard.scc \
    file://i1200-demo.scc \
    file://i1200-demo.cfg \
"

KMETA = "kernel-meta"

include recipes-kernel/linux/linux-lmp.inc
