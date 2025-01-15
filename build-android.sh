#!/bin/bash

set -e
echo "Tunggu sebentar"
sleep 3
echo "Kita update dan install library terlebih dahulu"
sleep 5
pkg update && pkg upgrade -y
pkg install wget cmake nano
echo "Cloning xmrig"
sleep 5
git clone https://github.com/xmrig/xmrig.git
mkdir xmrig/build
cd xmrig/build
# cmake
echo "Proses CMake"
sleep 5
if ! cmake -DWITH_HWLOC=OFF ..; then
    echo "Error: CMake configuration failed"
    exit 1
else
    cmake -DWITH_HWLOC=OFF ..
fi
# compile
echo "Compiling now"
sleep 5
if ! make; then
    echo "Error: Compiling failed"
    exit 1
else
    make && echo "Proses Instalasi selesai"
fi
sleep 3
echo "Proses clone konfigurasi"
sleep 1
echo "Proses clone konfigurasi ."
sleep 1
echo "Proses clone konfigurasi . ."
sleep 1
echo "Proses clone konfigurasi . . ."
sleep 3
cd
cd xmrig
if ! wget https://raw.githubusercontent.com/zcdk077/xmrig-termux/master/start.sh; then
    echo "Error: Cloning"
    exit 1
else
    wget https://raw.githubusercontent.com/zcdk077/xmrig-termux/master/start.sh
fi
sleep 1
if ! wget https://raw.githubusercontent.com/zcdk077/xmrig-termux/master/config.json; then
    echo "Error: Cloning"
    exit 1
else
    wget https://raw.githubusercontent.com/zcdk077/xmrig-termux/master/config.json
fi
sleep 1
if ! chmod +x config.json; then
    exit 1
else
    chmod +x config.json
fi
if ! chmod +x start.sh; then
    exit 1
else
    chmod +x start.sh && ech "Berhasil cloning konfigurasi"
fi
cd
