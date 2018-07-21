include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-config-mode-usb-media
PKG_VERSION:=2

include $(TOPDIR)/../package/gluon.mk

define Package/$(PKG_NAME)
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Enable USB media and set web path for access
  DEPENDS:=+gluon-config-mode-core +gluon-usb-media
endef

define Package/$(PKG_NAME)/description
  Enable USB media automount in config mode and set the 
  web path to access it via http://[IPv6]
endef

$(eval $(call BuildPackageGluon,$(PKG_NAME)))
