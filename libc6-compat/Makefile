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
	DEPENDS:=@(aarch64||x86_64) @USE_MUSL
	URL:=https://www.gnu.org/software/libc/
endef

define Package/$(PKG_NAME)/description
  Compatibility libraries for glibc
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/libc6-compat
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/$(ARCH)/libc6_$(ARCH).so $(1)/usr/libc6-compat/libc6.so
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
