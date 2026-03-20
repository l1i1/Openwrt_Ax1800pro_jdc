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

# Remove v2ray-related packages (Go 1.25+ or user request)
rm -rf feeds/small/v2ray-plugin
rm -rf feeds/small/v2ray-core
rm -rf feeds/small/v2ray-geodata
rm -rf feeds/small/v2raya

# Remove xray-related packages (Go 1.25+)
rm -rf feeds/small/xray-core
rm -rf feeds/small/xray-plugin

# Remove trojan-related packages (Boost/Go issues + user request)
rm -rf feeds/small/trojan
rm -rf feeds/small/trojan-go
rm -rf feeds/small/trojan-plus

# Remove ddns-go (Go 1.25+)
rm -rf feeds/kenzo/ddns-go

# Remove v2dat
rm -rf feeds/packages/utils/v2dat

# Remove other user-requested packages
rm -rf feeds/small/sing-box
rm -rf feeds/small/hysteria
