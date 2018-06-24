#!/bin/bash
mkdir /sysroot
mount LABEL=FACTORY_ROOT /sysroot
mkdir -p /sysroot/tmp/ro /sysroot/tmp/rw /sysroot/factory_root /sysroot/changes_root /sysroot/newroot
mount -o loop /sysroot/rootfs_elc.squashfs /sysroot/tmp/ro
mount LABEL=CHANGES_ROOT /sysroot/changes_root
mount --bind /sysroot/changes_root/changes /sysroot/tmp/rw
mount -t aufs -o br:/sysroot/tmp/rw=rw:/sysroot/tmp/ro=ro none /sysroot/newroot
systemctl switch-root /sysroot/newroot
