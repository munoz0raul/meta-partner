PACKAGECONFIG:append:qcom = " gallium"

# avoid conflict with adreno
do_install:append:qcom() {
    rm -rf ${D}${includedir}/KHR/*
}
