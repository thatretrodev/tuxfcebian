#!/bin/bash

# Create build directory

if [ -d build ]
then
	rm -rf build
fi

mkdir build
cd build

# Configure

lb config -a amd64 -b iso-hybrid --apt apt --debian-installer cdrom -d bullseye --mode debian --debian-installer-gui true --compression gzip --image-name tuxfcebian --iso-publisher thatretrodev

rm config/package-lists/live.list.chroot
cp ../config/live.list.chroot config/package-lists

# Build

PATH=$PATH:/sbin lb build

cd ..