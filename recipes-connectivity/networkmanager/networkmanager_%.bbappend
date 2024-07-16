FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:qcom = " file://stable-mac.conf"

do_install:append:qcom() {
    install -Dm 0644 ${WORKDIR}/stable-mac.conf ${D}${libdir}/NetworkManager/conf.d/stable-mac.conf
}
