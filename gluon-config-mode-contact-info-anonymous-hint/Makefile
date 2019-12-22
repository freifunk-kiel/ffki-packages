include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-config-mode-contact-info-anonymous-hint
PKG_VERSION:=2

include $(TOPDIR)/../package/gluon.mk

define Package/$(PKG_NAME)
  SECTION:=gluon
  CATEGORY:=Gluon
  TITLE:=Allows the user to provide contact information to be distributed in the mesh
  DEPENDS:=+gluon-web-admin +gluon-node-info
endef

define Package/$(PKG_NAME)/description
  Allows the user to provide contact information to be distributed in the mesh.
  Can be made obligatory in site.conf. If made obligatory, it shows a hint, that
  you can enter a space to run the node anonymously
endef

define Build/Compile
	$(call GluonSrcDiet,./luasrc,$(PKG_BUILD_DIR)/luadest/)
endef

$(eval $(call BuildPackageGluon,$(PKG_NAME)))
