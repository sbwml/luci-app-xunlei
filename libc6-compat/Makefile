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

define Package/$(PKG_NAME)/postrm
#!/bin/sh
ARCH=$(uname -m)
if [ "$ARCH" = "aarch64" ]; then
  LD=ld-linux-aarch64.so.1
else
  LD=ld-linux-x86-64.so.2
fi
[ -L "/lib/$LD" ] && rm -f /lib/$LD
[ $(grep -qs '/libc6' /proc/mounts) ] && umount /libc6
rm -rf /libc6
exit 0
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/libc6-compat
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/$(ARCH)/libc6_$(ARCH).so $(1)/usr/libc6-compat/libc6.so
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
