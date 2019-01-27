#!/bin/sh
set -e

rm -rf bin
echo "Build for target"
make clean
CROSS_COMPILE=aarch64-linux-gnu-
CORES=$(cat /proc/cpuinfo | grep processor | wc -l)
ANDROID=1 AFL_NO_X86=1 CC=${CROSS_COMPILE}gcc make -j${CORES}

mkdir bin
mkdir bin/arm64
cp afl-analyze afl-as afl-clang afl-clang++ afl-fuzz afl-g++ afl-gcc afl-gotcpu afl-showmap afl-tmin bin/arm64/
ln -s afl-as bin/arm64/as

echo "Build for host"
make clean
AFL_NO_X86=1 make -j${CORES}
