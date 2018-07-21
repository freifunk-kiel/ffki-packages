include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-usb-media
PKG_VERSION:=5

include $(TOPDIR)/../package/gluon.mk

define Package/$(PKG_NAME)
  SECTION:=gluon
  CATEGORY:=Gluon
  DEPENDS:=+gluon-core
  TITLE:=Automatically mount your USB media
endef

define Package/$(PKG_NAME)/description
  Automatically mount your USB media in the configured web path
  in gluon-config-mode-usb-media if "Enable USB media" is set to true
  The path should only contain natural
  characters [a-zA-Z0-9_%-%.]
endef

$(eval $(call BuildPackageGluon,$(PKG_NAME)))
