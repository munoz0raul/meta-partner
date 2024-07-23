Register and log in to https://www.renesas.com, then download firmware from
https://www.renesas.com/us/en/products/interface/usb-switches-hubs/upd720201-usb-30-host-controller.

Once downloaded, copy USB3-201-202-FW-20131112.zip at recipes-firmware/firmware/renesas-upd720201
and add the renesas-upd720201 package to your image.

For meta-subscriber-overrides users (FoundriesFactory):

# Add downloaded firmware zip to the correct layer location
cd meta-subscriber-overrides
mkdir -p recipes-firmware/firmware/renesas-upd720201
cp /tmp/USB3-201-202-FW-20131112.zip recipes-firmware/firmware/renesas-upd720201
echo 'FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"' > recipes-firmware/firmware/renesas-upd720201_20131112.bbappend
echo 'SRC_URI += "file://USB3-201-202-FW-20131112.zip"' >> recipes-firmware/firmware/renesas-upd720201_20131112.bbappend

# Add renesas-upd720201 to lmp-factory-image
echo 'CORE_IMAGE_BASE_INSTALL += "renesas-upd720201"' >> recipes-samples/images/lmp-factory-image.bb

# Commit and push to create a new build
git add .
git commit -s -m "renesas-upd720201: add firmware file"
git push
