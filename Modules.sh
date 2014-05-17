#!/bin/bash

cd kernel/sony/u8500
export ARCH=arm
export CROSS_COMPILE=/home/devhub/cm11/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin/arm-eabi-
make mrproper
make kumquat_defconfig
make modules
cd ../../..
mkdir -p out/target/product/kumquat/system/lib/modules/
cp -fr kernel/sony/u8500/*/*/*.ko out/target/product/kumquat/system/lib/modules/
cp -fr kernel/sony/u8500/*/*/*/*.ko out/target/product/kumquat/system/lib/modules/
cp -fr kernel/sony/u8500/*/*/*/*/*.ko out/target/product/kumquat/system/lib/modules/
cp -fr kernel/sony/u8500/*/*/*/*/*/*.ko out/target/product/kumquat/system/lib/modules/
