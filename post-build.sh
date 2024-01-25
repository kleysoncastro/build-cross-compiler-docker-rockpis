#!/usr/bin/env bash

docker exec -it cross-compile sh -c 'tar -xvf /toolchain/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu.tar.xz -C /toolchain/gcc/'

docker exec -it cross-compile sh -c 'tar -xvf /toolchain/sysroot.tar.xz -C /toolchain/'

