include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-usb-media
PKG_VERSION:=4
PKG_RELEASE:=$(GLUON_BRANCH)

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(GLUONDIR)/include/package.mk

define Package/gluon-usb-media
  SECTION:=gluon
  CATEGORY:=Gluon
  DEPENDS:=+gluon-core
  TITLE:=Automatically mount your USB media
endef

define Package/gluon-usb-media/description
	Automatically mount your USB media in the configured web path
	in gluon-config-mode-usb-media if "Enable USB media" is set to true
	The path is of the type "hostname", which is fitting perfect as a
	string that includes only [a-zA-Z0-9_%-%.]
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile
endef

define Package/gluon-usb-media/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,gluon-usb-media))
