#!/bin/sh
diskutil mount boot
make
cp kernel.img /Volumes/boot/kernel.img
diskutil unmountDisk boot