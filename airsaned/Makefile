include $(TOPDIR)/rules.mk

PKG_NAME:=airsaned
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/SimulPiscator/AirSane.git
PKG_SOURCE_VERSION:=1eb3f1b
PKG_SOURCE_DATE:=2023-11-26
PKG_VERSION:=$(PKG_SOURCE_DATE)-$(PKG_SOURCE_VERSION)
PKG_MIRROR_HASH:=a06f299f7c29e9988c8f9e22c79b2baad5985e7c83a3160bf478a42ac7c61083

PKG_MAINTAINER:=SimulPiscator <example@example.com>
PKG_LICENSE:=GPL-3.0

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/airsaned
  TITLE:=A SANE WebScan frontend that supports Apple's AirScan protocol
  URL:=https://github.com/SimulPiscator/AirSane
  SECTION:=utils
  CATEGORY:=Utilities
  DEPENDS:=+libsane +libjpeg +libpng +libavahi-client +libusb-1.0 +libstdcpp
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

$(eval $(call BuildPackage,airsaned))
