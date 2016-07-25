include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-config-mode-contact-obligatory
PKG_VERSION:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(GLUONDIR)/include/package.mk

PKG_CONFIG_DEPENDS += $(GLUON_I18N_CONFIG)


define Package/gluon-config-mode-contact-obligatory
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Set an obligatory custom string for a contact info that will be distributed in the mesh.
  DEPENDS:=gluon-config-mode-core-virtual +gluon-node-info
endef

define Package/gluon-config-mode-contact-obligatory/description
	Set an obligatory custom string for a contact info that will be distributed in the mesh.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
	$(call GluonBuildI18N,gluon-config-mode-contact-obligatory,i18n)
endef

define Package/gluon-config-mode-contact-obligatory/install
	$(CP) ./files/* $(1)/
	$(call GluonInstallI18N,gluon-config-mode-contact-obligatory,$(1))
endef

define Package/gluon-config-mode-contact-obligatory/postinst
#!/bin/sh
$(call GluonCheckSite,check_site.lua)
endef

$(eval $(call BuildPackage,gluon-config-mode-contact-obligatory))
