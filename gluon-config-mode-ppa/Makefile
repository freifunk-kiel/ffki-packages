include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-config-mode-ppa
PKG_VERSION:=2

include $(TOPDIR)/../package/gluon.mk

define Package/$(PKG_NAME)
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Add a checkbox to accept the PPA
  DEPENDS:=+gluon-config-mode-core +gluon-node-info
endef

$(eval $(call BuildPackageGluon,$(PKG_NAME)))
