#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-lyin-frpc
PKG_VERSION:=1
PKG_RELEASE:=12

PO2LMO:=$(TOPDIR)/po2lmo

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-lyin-frpc
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=frpc
  MAINTAINER:=lyin
  PKGARCH:=all
endef

define Package/luci-app-lyin-frpc/description
 frpc web UI
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/i18n/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Compile
endef

define Package/luci-app-lyin-frpc/postinst
#!/bin/sh 
[ -n "$${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-frp ) && rm -f /etc/uci-defaults/luci-frp
	/etc/init.d/frp enable >/dev/null 2>&1
	exit 0
}
endef

define Package/luci-app-lyin-frpc/install
	$(CP) ./root/* $(1)
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(CP) ./luasrc/* $(1)/usr/lib/lua/luci
endef

$(eval $(call BuildPackage,luci-app-lyin-frpc))
