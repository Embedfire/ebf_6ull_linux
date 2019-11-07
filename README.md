# ebf_6ull_linux

## 开发环境

**ubuntu18.04**

**安装独立编译工具链**

arm-linux-gnueabihf-gcc：v7.4.0
```bash
sudo apt-get install gcc-arm-linux-gnueabihf
```

## 内核编译过程

**清除编译信息**

```bash
make ARCH=arm clean
```

## 设置配置选项,使用野火开发板配置

```bash
make ARCH=arm imx6_v7_ebf_defconfig
```

## 开始编译
```bash
make ARCH=arm -j10 CROSS_COMPILE=arm-linux-gnueabihf- 
```

## 编译生成的镜像输出路径

**内核镜像路径**

```bash
ebf_6ull_linux/arch/arm/boot
```

**设备树输出路径**

```bash
ebf_6ull_linux/arch/arm/boot/dts
```


## 只编译设备树
在后面添加 `dtbs` 即可
```bash
make ARCH=arm -j10 CROSS_COMPILE=arm-linux-gnueabihf- dtbs
```

---

## 编译的设备树：

- imx6ull-14x14-evk.dts 
- imx6ull-14x14-evk-btwifi.dts 
- imx6ull-14x14-evk-emmc.dts 
- imx6ull-14x14-evk-gpmi-weim-43.dts 
- imx6ull-14x14-evk-emmc-43.dts 
- imx6ull-14x14-evk-gpmi-weim-hdmi.dts 
- imx6ull-14x14-evk-emmc-hdmi.dts 
- imx6ull-14x14-evk-gpmi-weim-wifi.dts 
- imx6ull-14x14-evk-emmc-wifi.dts 
- imx6ull-14x14-evk-gpmi-weim-cam-dht11.dts 
- imx6ull-14x14-evk-emmc-cam-dht11.dts


## make menuconfig配置选项（部分）

**触摸屏驱动：**
```bash
 Prompt: Goodix I2C touchscreen   
  Location:            
   -> Device Drivers         
      -> Input device support  
       -> Generic input layer (needed for keyboard, mouse, ...) (INPUT [=y]) 
 (1)       -> Touchscreens (INPUT_TOUCHSCREEN [=y])  
 #这个也要使能
    [*]   Goodix touchpanel GT9xx series 
    <*>     Goodix GT9xx touch controller auto update support  
    <*>     Goodix GT9xx Tools for debuging     
```

**单总线驱动：**

```bash
 Prompt: Dallas's 1-wire support     
 Location:                         
  (1) -> Device Drivers          
  [*]   Userspace communication over connector (NEW)    
```

**添加MPU6050的支持：**

```bash
Prompt: Invensense MPU6050 devices      
Location:  
  -> Device Drivers               
    -> Industrial I/O support (IIO [=y])               
(1)     -> Inertial measurement units   
          <*> Invensense MPU6050 devices   
```

**WIFI蓝牙**
```bash
Location:  
  -> Device Drivers               
    -> Network device support                                         
       -> Wireless LAN
          ->

 <*>   Broadcom FullMAC wireless cards support                        
        (/lib/firmware/bcm/AP6236/Wi-Fi/fw_bcm43436b0.bin) Firmware path     
         (/lib/firmware/bcm/AP6236/Wi-Fi/nvram_ap6236.txt) NVRAM path    

#HCI串口配置也要选择
    -> Device Drivers               
    -> Network device support                                         
       -> Wireless LAN
          ->Bluetooth subsystem support   
              ->Bluetooth device drivers   
                  <*> HCI USB driver     
                  [*]   Broadcom protocol support  

  -> Networking support (NET [=y])     
    -> Bluetooth subsystem support (BT [=y]) 
      -> Bluetooth device drivers    
        <*> HCI USB driver    
        [*]   Broadcom protocol support  
```

**PPP点对点拨号：**

所有PPP相关的都选中
```bash
 Prompt: PPP (point-to-point protocol) support              
  Location:          
  -> Device Drivers 
    (1)   -> Network device support (NETDEVICES [=y])       
```

**蓝牙和HCI子系统**

```bash
    -> Networking support (NET [=y])              
     -> Bluetooth subsystem support (BT [=y])   
      (1)     -> Bluetooth device drivers   
  --- RF switch subsystem support                                         
          [*]   RF switch input support  
          <*>   Generic rfkill regulator driver
          <*>   GPIO RFKILL driver            
```

---

## 其他信息

**内核版本**

来源官方 `imx_4.1.15_2.0.0_ga` 分支

官方内核源码：[http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git/](http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git/)

```bash
# Clone 
git://git.freescale.com/imx/linux-imx.git

http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git
```
