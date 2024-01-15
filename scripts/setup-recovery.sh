#!/bin/sh

# we're a recovery image, so put recovery tools on the desktop
cp -r $RECIPEDIR/overlay/recovery/deck $ROOTDIR/home/
chown -R 1000:1000 $ROOTDIR/home/deck

# override to jump directly to plasma
mkdir -p $ROOTDIR/var/lib/overlays
cp -r $RECIPEDIR/overlay/recovery/etc $ROOTDIR/var/lib/overlays/
chmod 440 $ROOTDIR/var/lib/overlays/etc/upper/sudoers.d/wheel

mkdir -p $ROOTDIR/var/lib/overlays/etc/work/index
mknod $ROOTDIR/var/lib/overlays/etc/work/index/#6f1 c 0 0
chmod -R 0 $ROOTDIR/var/lib/overlays/etc/work/index

mkdir -p $ROOTDIR/var/lib/overlays/etc/work/work
chmod -R 0 $ROOTDIR/var/lib/overlays/etc/work/work
