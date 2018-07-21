include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-au-change
PKG_VERSION:=2
PKG_RELEASE:=1

include $(TOPDIR)/../package/gluon.mk

define Package/$(PKG_NAME)
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=changes autoupdater branch to stable
  DEPENDS:=+gluon-core
endef

$(eval $(call BuildPackageGluon,$(PKG_NAME)))
