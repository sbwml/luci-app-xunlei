#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nas-xunlei
PKG_VERSION:=3.5.2-3
PKG_RELEASE:=6
STRIP:=false

ifeq ($(ARCH),aarch64)
	BIN_HASH:=13293e0365b9b5a933ee5a3d72c014337e8a07cd7759bfb4656caf794926dfcb
endif

ifeq ($(ARCH),x86_64)
	BIN_HASH:=3f7301dc6183321d3a28f0bce2fdfb6695ac5b3ddf43f876810a00e0db8de386
endif

PKG_MAINTAINER:=sbwml <admin@cooluc.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=nas-xunlei
  DEPENDS:=@(aarch64||x86_64) +USE_MUSL:libc6-compat +USE_GLIBC:libpthread +libgcc +libstdcpp
  URL:=https://nas.xunlei.com/
endef

define Package/$(PKG_NAME)/description
  NAS Thunder download service
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
  rm -rf /usr/share/xunlei
  exit 0
endef

define Download/$(PKG_NAME)
  URL:=https://github.com/sbwml/nas-xunlei-binary/releases/download/v$(PKG_VERSION)
  URL_FILE:=$(ARCH)-v$(PKG_VERSION).tar.xz
  FILE:=nas-xunlei-$(ARCH)-v$(PKG_VERSION).tar.xz
  HASH:=$(BIN_HASH)
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(eval $(call Download,$(PKG_NAME)))
	$(TAR) -xf $(DL_DIR)/nas-xunlei-$(ARCH)-v$(PKG_VERSION).tar.xz -C $(PKG_BUILD_DIR)/
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/share/xunlei
	$(CP) $(PKG_BUILD_DIR)/bin $(1)/usr/share/xunlei/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/xunlei $(1)/usr/share/xunlei/xunlei

	$(INSTALL_DIR) $(1)/usr/syno/synoman/webman/modules
	$(INSTALL_BIN) $(CURDIR)/files/authenticate.cgi $(1)/usr/syno/synoman/webman/modules/authenticate.cgi

ifeq ($(CONFIG_USE_MUSL),y)
	$(INSTALL_DIR) $(1)/usr/share/xunlei/hack
	$(CP) $(PKG_BUILD_DIR)/hack/libc.so.6 $(1)/usr/share/xunlei/hack/
	$(CP) $(PKG_BUILD_DIR)/hack/libdl.so.2 $(1)/usr/share/xunlei/hack/
	$(CP) $(PKG_BUILD_DIR)/hack/libm.so.6 $(1)/usr/share/xunlei/hack/
	$(CP) $(PKG_BUILD_DIR)/hack/libpthread.so.0 $(1)/usr/share/xunlei/hack/
endif

endef

$(eval $(call BuildPackage,$(PKG_NAME)))
