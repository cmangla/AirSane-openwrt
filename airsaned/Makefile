include $(TOPDIR)/rules.mk

PKG_NAME:=airsaned
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/SimulPiscator/AirSane.git
PKG_SOURCE_VERSION:=32c1364bcf056ea623af306c230634fd97f3a5e8
PKG_SOURCE_DATE:=2024-09-29
PKG_VERSION:=0.4.3
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=SimulPiscator <example@example.com>
PKG_LICENSE:=GPL-3.0

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/libavahi-nobus-client
  $(call Package/avahi/Default)
  # FIXME: use `PROVIDES` to indicate alternative libavahi-client
  SECTION:=libs
  CATEGORY:=Libraries
  VARIANT:=nodbus
  DEPENDS:=+avahi-nodbus-daemon
  TITLE+= (libavahi-client library without dbus dependency)
endef

define Package/libavahi-nobus-client/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libavahi-client.so.* $(1)/usr/lib/
endef

define Package/airsaned
  TITLE:=A SANE WebScan frontend that supports Apple's AirScan protocol
  URL:=https://github.com/SimulPiscator/AirSane
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libsane +libjpeg +libpng +libavahi-nobus-client +libusb-1.0 +libstdcpp +libatomic
endef

define Package/airsaned/description
  A SANE WebScan frontend that supports Apple's AirScan protocol
endef

define Package/airsaned/conffiles
	/etc/config/airsaned
endef

define Package/airsaned/install 
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/airsaned $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) files/airsaned.init $(1)/etc/init.d/airsaned
	$(INSTALL_DIR) $(1)/etc/config/
	$(CP) files/airsaned.default $(1)/etc/config/airsaned
endef

$(eval $(call BuildPackage,libavahi-nobus-client))
$(eval $(call BuildPackage,airsaned))
