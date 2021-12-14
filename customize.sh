#!/bin/bash
#=================================================
# Description: Build OpenWrt using GitHub Actions
# Lisence: MIT
# Author: AndroidDeals
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' openwrt/package/base-files/files/bin/config_generate

#2. Deassociate bootstrap as default theme
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' openwrt/feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

#3. Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git vssr https://github.com/jerrykuku/luci-app-vssr' >>feeds.conf.default
echo 'src-git maxminddb https://github.com/jerrykuku/lua-maxminddb.git' >>feeds.conf.default
echo 'src-git https://github.com/jerrykuku/luci-theme-argon.git' >>feeds.conf.default
