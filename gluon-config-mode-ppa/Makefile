include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-config-mode-ppa
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(TOPDIR)/../package/gluon.mk

PKG_CONFIG_DEPENDS += $(GLUON_I18N_CONFIG)

define Package/$(PKG_NAME)
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Add a checkbox to accept the PPA
  DEPENDS:=+gluon-config-mode-core +gluon-node-info
endef

define Package/$(PKG_NAME)/description
  Add a checkbox to accept the PPA
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
	$(call GluonBuildI18N,$(PKG_NAME),i18n)
endef

define Package/$(PKG_NAME)/install
	$(CP) ./files/* $(1)/
	$(call GluonInstallI18N,$(PKG_NAME),$(1))
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
