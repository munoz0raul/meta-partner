FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://tmpfiles.conf"

fix_install_sota() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        # qprebuilt class moves all files from S on install
        mkdir -p ${D}${nonarch_libdir}/tmpfiles.d
        mv ${D}/tmpfiles.conf ${D}${nonarch_libdir}/tmpfiles.d/${PN}.conf
        (cd ${D}; rmdir -v --parents var/cache/camera)
    fi
}
do_install[postfuncs] += "fix_install_sota"

# replace pkg_postinst due removed /var/cache/camera
pkg_postinst:${PN}() {
    :
}

FILES:${PN} += "${nonarch_libdir}/tmpfiles.d/${PN}.conf"
