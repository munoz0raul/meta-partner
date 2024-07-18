fix_install_sota() {
    mkdir -p ${D}${datadir}/qwes
    mv ${D}/var/cache/qwes/QWESAttestationCert.pfm ${D}${datadir}/qwes

    rmdir -v \
        ${D}/var/cache/qwes \
        ${D}/var/cache
}

do_install[postfuncs] += "fix_install_sota"

FILES:${PN} += "${datadir}/qwes"
