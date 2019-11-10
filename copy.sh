
CURRENT_DIR=$(cd $(dirname $0); pwd)

mkdir -p ${CURRENT_DIR}/image/

cp ${CURRENT_DIR}/arch/arm/boot/zImage ${CURRENT_DIR}/image/

cp ${CURRENT_DIR}/arch/arm/boot/dts/imx6ull-14x14-evk.dtb ${CURRENT_DIR}/image/
cp ${CURRENT_DIR}/arch/arm/boot/dts/imx6ull-14x14-evk-gpmi-weim-43.dtb ${CURRENT_DIR}/image/
cp ${CURRENT_DIR}/arch/arm/boot/dts/imx6ull-14x14-evk-gpmi-weim-hdmi.dtb ${CURRENT_DIR}/image/
cp ${CURRENT_DIR}/arch/arm/boot/dts/imx6ull-14x14-evk-gpmi-weim-wifi.dtb ${CURRENT_DIR}/image/
cp ${CURRENT_DIR}/arch/arm/boot/dts/imx6ull-14x14-evk-gpmi-weim-cam-dht11.dtb ${CURRENT_DIR}/image/
cp ${CURRENT_DIR}/arch/arm/boot/dts/imx6ull-14x14-evk-emmc.dtb ${CURRENT_DIR}/image/
cp ${CURRENT_DIR}/arch/arm/boot/dts/imx6ull-14x14-evk-emmc-43.dtb ${CURRENT_DIR}/image/
cp ${CURRENT_DIR}/arch/arm/boot/dts/imx6ull-14x14-evk-emmc-hdmi.dtb ${CURRENT_DIR}/image/
cp ${CURRENT_DIR}/arch/arm/boot/dts/imx6ull-14x14-evk-emmc-wifi.dtb ${CURRENT_DIR}/image/
cp ${CURRENT_DIR}/arch/arm/boot/dts/imx6ull-14x14-evk-emmc-cam-dht11.dtb ${CURRENT_DIR}/image/

echo "all kernel and DTB are copied to ${CURRENT_DIR}/image/"

