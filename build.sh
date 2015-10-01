#!/bin/bash
cd ../..
echo
echo ">>> 初始化编译环境"
. build/envsetup.sh
echo
echo
echo ">>> 进入机型目录"
cd devices/A0001
pwd
echo
echo
echo ">>> 清除缓存文件"
flyme clean
echo ">>> 编译刷机包"
flyme fullota

if [ -e ./out/flyme*.zip ]
   then
mkdir -p out/flyme
mv ./out/flyme*.zip ./out/flyme
cd ./out/flyme
unzip flyme*.zip
rm -rf flyme*.zip
patch -p1 < ../../other/updater-script.patch
cp -rf ../../other/radio/* ./
zip -r flyme.zip *
java -jar ../../../../build/tools/signapk.jar ../../../../build/security/platform.x509.pem ../../../../build/security/platform.pk8 flyme.zip flyme_A0001_Nucked_$(date +%Y%m%d).zip
mv flyme*.zip ../
rm -rf ../flyme
rm -rf ../flyme.zip
echo
echo "刷机包编译完成！刷机包在out目录中"
cd ..
pwd
echo
fi
