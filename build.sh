#!/bin/bash

export PATH=/opt/arm-gcc/bin:$PATH
export ARCH=arm 
export CROSS_COMPILE=arm-linux-gnueabihf- 

workdir=$(cd $(dirname $0); pwd)
lcdsize="5.0"

if [ -f "$workdir/.lcdsize" ]; then
    echo "have a $workdir/.lcdsize"
else
    echo "touch a $workdir/.lcdsize"
    touch $workdir/.lcdsize

    diff $workdir/drivers/video/logo/logo_linux_clut224_5.0.ppm $workdir/drivers/video/logo/logo_linux_clut224.ppm > /dev/null
    if [ $0 == 0 ]; then
        echo "old lcd size: 5.0" > $workdir/.lcdsize
    else
        echo "old lcd size: 4.3" > $workdir/.lcdsize
    fi
fi

if [ " $1" == " " ] || [ "$1" == "5.0" ]; then
    echo "LCD size: 5.0"

elif [ "$1" == "4.3" ]; then
    echo "LCD size: 4.3"
    lcdsize="4.3"

else
    echo "LCD size error"
    echo "usage: $0 [LCD size]"
    echo "LCD size:"
    echo "  default：5.0"
    echo "  optional：4.3"
    exit 0
fi

cat $workdir/.lcdsize | grep -i "5.0"

if [ $? -ne 0 ]; then
    cat $workdir/.lcdsize | grep -i "4.3"  
    if [ $? -ne 0 ]; then
        echo "LCD size error"
        exit 1
    fi

    if [ $lcdsize == "5.0" ]; then
        cp -v $workdir/drivers/video/logo/logo_linux_clut224_5.0.ppm $workdir/drivers/video/logo/logo_linux_clut224.ppm
        echo "old lcd size: 5.0" > $workdir/.lcdsize
    fi
else
    if [ $lcdsize == "4.3" ]; then
        echo "need 4.3"
        cp -v $workdir/drivers/video/logo/logo_linux_clut224_4.3.ppm $workdir/drivers/video/logo/logo_linux_clut224.ppm
        echo "old lcd size: 4.3" > $workdir/.lcdsize
    fi
fi


make ARCH=arm imx6_v7_ebf_defconfig

make ARCH=arm -j10 CROSS_COMPILE=arm-linux-gnueabihf- 

make -j10;./copy.sh;make modules_install ARCH=arm INSTALL_MOD_PATH=my_lib/

