# Copyright (C) 2016 Openwrt.org
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-xunlei
PKG_VERSION:=1.0.1
PKG_RELEASE:=2

LUCI_TITLE:=LuCI support for NAS-Xunlei
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+nas-xunlei
PKG_MAINTAINER:=sbwml <admin@cooluc.com>

define Package/$(PKG_NAME)/conffiles
/etc/xunlei
/etc/synoinfo.conf
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
[ -n "${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-xunlei ) && rm -f /etc/uci-defaults/luci-xunlei
	exit 0
}
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
  rm -rf /var/packages/pan-xunlei-com
  exit 0
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
