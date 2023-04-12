#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libc6-compat
PKG_VERSION:=2.34
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=libc6-compat
	DEPENDS:=@USE_MUSL @aarch64
	URL:=https://www.gnu.org/software/libc/
endef

define Package/$(PKG_NAME)/description
  compatibility libraries for glibc
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lib/ld-linux-aarch64.so.1 $(1)/lib/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lib/libc.so.6 $(1)/lib/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lib/libdl.so.2 $(1)/lib/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lib/libm.so.6 $(1)/lib/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lib/libpthread.so.0 $(1)/lib/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
