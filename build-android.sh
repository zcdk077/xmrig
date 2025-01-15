#!/bin/bash

set -e
echo "Tunggu sebentar"
echo "Update dan install library"
pkg update && pkg upgrade -y
pkg install wget cmake nano
echo "Cloning and starting compiling"
git clone https://github.com/xmrig/xmrig.git
mkdir xmrig/build
cd xmrig/build
# cmake
echo "Proses CMake"
if ! cmake -DWITH_HWLOC=OFF ..; then
    echo "Error: CMake configuration failed"
    exit 1
else
    cmake -DWITH_HWLOC=OFF ..
fi
# compile
echo "Compiling now"
if ! make; then
    echo "Error: Compiling failed"
    exit 1
else
    make && echo "Done... you can use run script now"
fi
# remove build-android.sh
echo "Menghapus build"
cd ..
echo "Proses hapus build"
if ! rm -r build-android.sh; then
    exit 1
else
    rm -r build-android.sh && echo "Build telah dihapus"
fi
cd xmrig
echo "Proses clone konfigurasi"
if ! wget https://raw.githubusercontent.com/zcdk077/xmrig-termux/master/start.sh && wget https://raw.githubusercontent.com/zcdk077/xmrig-termux/master/config.json && chmod +x config.json start.sh; then
    exit 1
else
    wget https://raw.githubusercontent.com/zcdk077/xmrig-termux/master/start.sh && wget https://raw.githubusercontent.com/zcdk077/xmrig-termux/master/config.json && chmod +x config.json start.sh && echo "Berhasil clone konfigurasi"
fi
