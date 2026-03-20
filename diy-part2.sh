#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Fix mbedtls GCC14 + musl fortify compatibility
# Insert after cmake.mk include to filter out -D_FORTIFY_SOURCE
sed -i '/include.*cmake\.mk/a TARGET_CFLAGS:=$(filter-out -D_FORTIFY_SOURCE=%,$(TARGET_CFLAGS))' package/libs/mbedtls/Makefile

# Remove v2ray/trojan/xray/ddns-go from feeds/small (kenzok8/small)
rm -rf feeds/small/v2ray-plugin
rm -rf feeds/small/v2ray-core
rm -rf feeds/small/v2ray-geodata
rm -rf feeds/small/v2raya
rm -rf feeds/small/xray-core
rm -rf feeds/small/xray-plugin
rm -rf feeds/small/trojan
rm -rf feeds/small/trojan-go
rm -rf feeds/small/trojan-plus
rm -rf feeds/small/sing-box
rm -rf feeds/small/hysteria

# Remove from feeds/kenzo (kenzok8/openwrt-packages)
rm -rf feeds/kenzo/ddns-go

# Remove v2dat from feeds/packages
rm -rf feeds/packages/utils/v2dat

# Remove from package/helloworld (xiaorouji/openwrt-passwall-packages)
rm -rf package/helloworld/v2ray-plugin
rm -rf package/helloworld/v2ray-geodata
rm -rf package/helloworld/xray-core
rm -rf package/helloworld/trojan-plus
rm -rf package/helloworld/trojan-go
rm -rf package/helloworld/sing-box
rm -rf package/helloworld/hysteria

# Disable .config options that reference removed packages
sed -i 's/CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray_Plugin=y/# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_V2ray_Plugin is not set/' .config
sed -i 's/CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray=y/# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Xray is not set/' .config
sed -i 's/CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus=y/# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Trojan_Plus is not set/' .config
sed -i 's/CONFIG_PACKAGE_luci-app-passwall_INCLUDE_SingBox=y/# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_SingBox is not set/' .config
sed -i 's/CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Hysteria=y/# CONFIG_PACKAGE_luci-app-passwall_INCLUDE_Hysteria is not set/' .config
sed -i 's/CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Xray=y/# CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Xray is not set/' .config
sed -i 's/CONFIG_PACKAGE_sing-box=y/# CONFIG_PACKAGE_sing-box is not set/' .config
