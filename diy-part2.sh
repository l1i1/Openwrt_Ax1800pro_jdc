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

#淇敼golang鐗堟湰
#rm -rf feeds/packages/lang/golang
#git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
#./scripts/feeds install -a -f

# 淇 mbedtls 涓?GCC 14 + musl fortify 鐨勫吋瀹规€ч棶棰?sed -i "/include.*cmake\.mk/a TARGET_CFLAGS:=`$(filter-out -D_FORTIFY_SOURCE=%,`$(TARGET_CFLAGS))" package/libs/mbedtls/Makefile

# 绉婚櫎 ddns-go (闇€瑕?Go 1.25+锛屽綋鍓嶇幆澧冧负 Go 1.24)
rm -rf feeds/kenzo/ddns-go

# 绉婚櫎 trojan-plus (Boost system 搴撶紪璇戦棶棰?
rm -rf feeds/small/trojan-plus