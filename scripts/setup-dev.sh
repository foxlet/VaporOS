#!/bin/sh

# we're a dev image, so jump straight to the desktop
mkdir -p $ROOTDIR/var/lib/overlays/etc/upper/sddm.conf.d/
cp $RECIPEDIR/overlay/dev/zz-steamos-autologin.conf $ROOTDIR/var/lib/overlays/etc/upper/sddm.conf.d/zz-steamos-autologin.conf
