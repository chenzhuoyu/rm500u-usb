#!/bin/bash

set -ex

PKG=linux-source-$(uname -r | cut -d- -f1)
SRC=/usr/src/${PKG}.tar.bz2

if [[ "$(dpkg --get-selections ${PKG} 2>/dev/null | wc -l)" -eq "0" ]]; then
    sudo apt install ${PKG}
fi

if [[ ! -f option.c || ! -f usb-wwan.h ]]; then
    tar jxvf ${SRC} --strip-components=4 --occurrence ${PKG}/drivers/usb/serial/{option.c,usb-wwan.h}
    patch option.c option.patch
fi

