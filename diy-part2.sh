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

# Modify default IP
sed -i 's/192.168.10.1/192.168.1.88/g' package/base-files/files/bin/config_generate

# 修改连接数数
#sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

#修复连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# 添加皮肤 themes
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
# theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon

# 主机名称
sed -i 's/OpenWrt/OpenWrt/g' package/base-files/files/bin/config_generate

# 版本号
sed -i "s/OpenWrt /XiaoJie build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

#按需添加软件包
# adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
# OpenClash
git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# 京东签到
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
# 性能实时监测
git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata
# DNS广告过滤（依赖于dnsmasq-full，与OpenWrt默认的dnsmasq冲突，所以编译时请确保已经取消勾选base-system -> dnsmasq）
# git clone https://github.com/kiddin9/luci-app-dnsfilter.git package/luci-app-dnsfilter
# 融合IPTV
git clone https://github.com/riverscn/openwrt-iptvhelper.git package/openwrt-iptvhelper
#添加smartdns
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
