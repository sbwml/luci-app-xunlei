#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nas-xunlei
PKG_VERSION:=3.5.2
PKG_RELEASE:=2

STRIP:=false

PKG_MAINTAINER:=sbwml <admin@cooluc.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=nas-xunlei
  DEPENDS:=@aarch64 +USE_MUSL:libc6-compat +USE_GLIBC:librt +USE_GLIBC:libpthread +libgcc +libstdcpp
  URL:=https://nas.xunlei.com/
endef

define Package/$(PKG_NAME)/description
  NAS XunLei
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
  rm -rf /usr/share/xunlei
  exit 0
endef

define Download/$(PKG_NAME)
  URL:=https://github.com/sbwml/nas-xunlei-binary/releases/download/v$(PKG_VERSION)
  URL_FILE:=$(ARCH)-v$(PKG_VERSION).tar.gz
  FILE:=nas-xunlei-$(ARCH)-v$(PKG_VERSION).tar.gz
  HASH:=641d2c03d904c463c8d04a134c68f7dfea12e98c865736701f6a28c484b4bbed
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(eval $(call Download,$(PKG_NAME)))
	$(TAR) -xzf $(DL_DIR)/nas-xunlei-$(ARCH)-v$(PKG_VERSION).tar.gz -C $(PKG_BUILD_DIR)/
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/share/xunlei
	$(CP) $(PKG_BUILD_DIR)/bin $(1)/usr/share/xunlei/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/xunlei $(1)/usr/share/xunlei/xunlei

	$(INSTALL_DIR) $(1)/usr/syno/synoman/webman/modules $(1)/etc
	$(INSTALL_CONF) $(CURDIR)/files/synoinfo.conf $(1)/etc/synoinfo.conf
	$(INSTALL_BIN) $(CURDIR)/files/authenticate.cgi $(1)/usr/syno/synoman/webman/modules/authenticate.cgi
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
