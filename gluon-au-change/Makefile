include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-au-change
PKG_VERSION:=1
PKG_RELEASE:=1

include $(TOPDIR)/../package/gluon.mk

define Package/$(PKG_NAME)
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=changes autoupdater branch to stable
  DEPENDS:=+gluon-core
endef

define Package/$(PKG_NAME)/description
  changes autoupdater branch to stable
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
