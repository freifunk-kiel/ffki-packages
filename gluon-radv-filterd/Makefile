include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-radv-filterd
PKG_VERSION:=1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/gluon-radv-filterd
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Filter IPv6 router advertisements
  DEPENDS:=+gluon-ebtables +libgluonutil +libbatadv +libnl-tiny
endef

MAKE_VARS += \
        LIBNL_NAME="libnl-tiny" \
        LIBNL_GENL_NAME="libnl-tiny"

define Package/gluon-radv-filterd/install
	$(Gluon/Build/Install)

	$(INSTALL_DIR) $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gluon-radv-filterd $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,gluon-radv-filterd))
