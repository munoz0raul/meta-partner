FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# Extend standard groups with audio and users
USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,audio,users,input weston"
