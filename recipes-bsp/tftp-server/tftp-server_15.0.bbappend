FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://tmpfiles.conf"

fix_install_sota() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        # qprebuilt class moves all files from S on install
        mkdir -p ${D}${nonarch_libdir}/tmpfiles.d
        mv ${D}/tmpfiles.conf ${D}${nonarch_libdir}/tmpfiles.d/${PN}.conf

        rmdir -v \
            ${D}${localstatedir}/lib/tombstones/modem \
            ${D}${localstatedir}/lib/tombstones/lpass \
            ${D}${localstatedir}/lib/tombstones \
            ${D}${localstatedir}/lib/persist/rfs/shared \
            ${D}${localstatedir}/lib/persist/rfs/msm/adsp \
            ${D}${localstatedir}/lib/persist/rfs/msm/mpss \
            ${D}${localstatedir}/lib/persist/rfs/msm \
            ${D}${localstatedir}/lib/persist/rfs/mdm/adsp \
            ${D}${localstatedir}/lib/persist/rfs/mdm/mpss \
            ${D}${localstatedir}/lib/persist/rfs/mdm \
            ${D}${localstatedir}/lib/persist/rfs \
            ${D}${localstatedir}/lib/persist/hlos_rfs/shared \
            ${D}${localstatedir}/lib/persist/hlos_rfs
    fi
}
do_install[postfuncs] += "fix_install_sota"

FILES:${PN} += "${nonarch_libdir}/tmpfiles.d/${PN}.conf"
