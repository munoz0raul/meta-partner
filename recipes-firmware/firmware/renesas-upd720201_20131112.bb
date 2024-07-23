DESCRIPTION = "Renesas UPD720201 USB 3.0 Host Controller Firmware"
HOMEPAGE = "https://www.renesas.com/us/en/products/interface/usb-switches-hubs/upd720201-usb-30-host-controller"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = "file://${WORKDIR}/Renesas-Proprietary.txt;md5=efe64f54fbf3a29088de3a8aa1c579ea"

SRC_URI = "file://Renesas-Proprietary.txt"
## To be added by the user via bbappend
#SRC_URI += "file://USB3-201-202-FW-20131112.zip"
SRC_URI[sha256sum] = "fa86cd5714b25da58ca6238d10b5a2bb876ad48d0f1367c849faa593c57b248d"

inherit allarch

S = "${WORKDIR}/USB3-201-202-FW-${PV}"

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
	install -D -m644 ${S}/K2026090.mem ${D}${nonarch_base_libdir}/firmware/renesas_usb_fw.mem
}

FILES:${PN} = "${nonarch_base_libdir}/firmware/renesas_usb_fw.mem"

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
