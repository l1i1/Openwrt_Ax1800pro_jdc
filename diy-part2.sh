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




#修改golang版本
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
#./scripts/feeds install -a -f

# 修复 mbedtls 与 GCC 14 + musl fortify 的兼容性问题
# 参考: https://github.com/openwrt/openwrt/issues/15351
# 在 cmake.mk 之后插入 TARGET_CFLAGS filter，移除 FORTIFY_SOURCE
sed -i '/include.*cmake\.mk/a TARGET_CFLAGS:=$(filter-out -D_FORTIFY_SOURCE=%,$(TARGET_CFLAGS))' package/libs/mbedtls/Makefile

# 修复 ddns-go Go 版本要求问题 - 降级到支持 Go 1.24 的版本
cd feeds/kenzo/ddns-go && git checkout v6.14.0 && cd ../../..

