FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

LIC_FILES_CHKSUM:qcom = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
                         file://libweston/compositor.c;endline=27;md5=b22751d2c88735d2dcb492b1c5a47242 \
"
SRC_URI:remove:qcom = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz"
SRC_URI:prepend:qcom = "git://git.codelinaro.org/clo/le/wayland/weston.git;protocol=https;branch=${SRCBRANCH} "
SRCREV:qcom = "e00a1983d58f1e7fc3263a510c1133450c56573f"
SRCBRANCH:qcom = "display.qclinux.1.0.r1-rel"
S:qcom ="${WORKDIR}/git"

DEPENDS:append:qcom = " property-vault gbm display-hal-linux"

EXTRA_OEMESON:append:qcom = " -Ddeprecated-wl-shell=true -Dbackend-default=auto -Dbackend-rdp=false"

PACKAGECONFIG:remove:qcom = "kms"
PACKAGECONFIG:append:qcom = " sdm disablepowerkey"

# Override (extra dependencies)
PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcursor xwayland"
# Weston on SDM
PACKAGECONFIG[sdm] = "-Dbackend-sdm=true,-Dbackend-sdm=false"
# Weston with disabling display power key
PACKAGECONFIG[disablepowerkey] = "-Ddisable-power-key=true,-Ddisable-power-key=false"

LDFLAGS:append:qcom = " -ldrmutils -ldisplaydebug -lglib-2.0"
CXXFLAGS:append:qcom = " -I${STAGING_INCDIR}/sdm"

PACKAGE_ARCH:qcom = "${MACHINE_ARCH}"
