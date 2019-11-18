#!/bin/bash

export PATH=/opt/arm-gcc/bin:$PATH
export ARCH=arm 
export CROSS_COMPILE=arm-linux-gnueabihf- 

make ARCH=arm imx6_v7_ebf_defconfig

make ARCH=arm -j10 CROSS_COMPILE=arm-linux-gnueabihf- 

make -j10;./copy.sh;make modules_install ARCH=arm INSTALL_MOD_PATH=my_lib/

