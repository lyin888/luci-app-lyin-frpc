#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-lyin-frpc
PKG_VERSION:=0.3.0
PKG_RELEASE:=5
PKG_PO_VERSION:=$(PKG_VERSION)-$(PKG_RELEASE)

LUCI_TITLE:=LuCI Support for frpc
LUCI_PKGARCH:=all
LUCI_DEPENDS:=

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
