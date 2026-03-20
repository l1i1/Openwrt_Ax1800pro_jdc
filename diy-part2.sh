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

# Remove packages requiring Go 1.25+ (current env is Go 1.24)
rm -rf feeds/kenzo/ddns-go
rm -rf feeds/small/v2ray-plugin
rm -rf feeds/small/xray-core

# Remove trojan-plus (Boost system library issue)
rm -rf feeds/small/trojan-plus
