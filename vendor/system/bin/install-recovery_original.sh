#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9338880 a103f165aeed2cff90deed32e169a7c507281c8c 6649856 0c78aef93db3d1ac1a9ac89be1649e96e78ebf68
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:9338880:a103f165aeed2cff90deed32e169a7c507281c8c; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6649856:0c78aef93db3d1ac1a9ac89be1649e96e78ebf68 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery a103f165aeed2cff90deed32e169a7c507281c8c 9338880 0c78aef93db3d1ac1a9ac89be1649e96e78ebf68:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
