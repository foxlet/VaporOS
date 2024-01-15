#!/bin/sh

kernel=$(find /usr/lib/modules -maxdepth 1 -mindepth 1 -printf "%f\n")
dracut --force --no-hostonly --persistent-policy by-partuuid /boot/initramfs-linux.img ${kernel[0]}
