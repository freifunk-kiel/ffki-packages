include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-au-change
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/gluon-au-change
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=changes autoupdater branch to stable
  DEPENDS:=+gluon-core
endef

define Package/gluon-au-change/description
	changes autoupdater branch to stable
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/gluon-au-change/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,gluon-au-change))
