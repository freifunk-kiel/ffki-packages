include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-config-mode-hostname-no-pretty
PKG_VERSION:=1

include $(TOPDIR)/../package/gluon.mk

PKG_CONFIG_DEPENDS += $(GLUON_I18N_CONFIG)

define Package/$(PKG_NAME)
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Set the hostname but allows no empty string
  DEPENDS:=+gluon-config-mode-core
endef

define Build/Compile
	$(call GluonBuildI18N,$(PKG_NAME),i18n)
	$(call GluonSrcDiet,./luasrc,$(PKG_BUILD_DIR)/luadest/)
endef

define Package/$(PKG_NAME)/install
	$(CP) $(PKG_BUILD_DIR)/luadest/* $(1)/
	$(call GluonInstallI18N,$(PKG_NAME),$(1))
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
