include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-config-mode-hostname-no-pretty
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(GLUONDIR)/include/package.mk

PKG_CONFIG_DEPENDS += $(GLUON_I18N_CONFIG)


define Package/gluon-config-mode-hostname-no-pretty
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Set the hostname but allows no special characters
  DEPENDS:=gluon-config-mode-core-virtual
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
	$(call GluonBuildI18N,gluon-config-mode-hostname-no-pretty,i18n)
	$(call GluonSrcDiet,./luasrc,$(PKG_BUILD_DIR)/luadest/)
endef

define Package/gluon-config-mode-hostname-no-pretty/install
	$(CP) $(PKG_BUILD_DIR)/luadest/* $(1)/
	$(call GluonInstallI18N,gluon-config-mode-hostname-no-pretty,$(1))
endef

$(eval $(call BuildPackage,gluon-config-mode-hostname-no-pretty))
