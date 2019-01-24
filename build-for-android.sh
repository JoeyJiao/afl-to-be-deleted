#!/bin/sh

CROSS_COMPILE=aarch64-linux-gnu-
CORES=$(cat /proc/cpuinfo | grep processor | wc -l)
__ANDROID__=1 AFL_NO_X86=1 CC=${CROSS_COMPILE}gcc make -j${CORES}
