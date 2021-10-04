################################################################################
#
# shadow
#
################################################################################

SHADOW_VERSION = 4.9
SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/v$(SHADOW_VERSION)
SHADOW_LICENSE = BSD
SHADOW_LICENSE_FILES = COPYING

ifneq ($(BR2_PACKAGE_SHADOW_PROGS),y)

# install only newuidmap newgidmap

# also install utils for cloud-init

SHADOW_CONF_OPTS = --enable-subordinate-ids

define SHADOW_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(SHADOW_SRCDIR)/lib
	$(TARGET_MAKE_ENV) $(MAKE) -C $(SHADOW_SRCDIR)/libmisc
	$(TARGET_MAKE_ENV) $(MAKE) -C $(SHADOW_SRCDIR)/src newuidmap
	$(TARGET_MAKE_ENV) $(MAKE) -C $(SHADOW_SRCDIR)/src newgidmap

	$(TARGET_MAKE_ENV) $(MAKE) -C $(SHADOW_SRCDIR)/src useradd
	$(TARGET_MAKE_ENV) $(MAKE) -C $(SHADOW_SRCDIR)/src groupadd
endef

define SHADOW_INSTALL_CMDS
	install -m 4755 $(@D)/src/newuidmap /usr/bin/
	install -m 4755 $(@D)/src/newgidmap /usr/bin/

	install -m 0755 $(@D)/src/useradd /usr/sbin/
	install -m 0755 $(@D)/src/groupadd /usr/sbin/
endef

define SHADOW_INSTALL_STAGING_CMDS
	install -m 4755 $(@D)/src/newuidmap $(STAGING_DIR)/usr/bin/
	install -m 4755 $(@D)/src/newgidmap $(STAGING_DIR)/usr/bin/

	install -m 0755 $(@D)/src/useradd $(STAGING_DIR)/usr/sbin/
	install -m 0755 $(@D)/src/groupadd $(STAGING_DIR)/usr/sbin/
endef

define SHADOW_INSTALL_TARGET_CMDS
	install -m 4755 $(@D)/src/newuidmap $(TARGET_DIR)/usr/bin/
	install -m 4755 $(@D)/src/newgidmap $(TARGET_DIR)/usr/bin/

	install -m 0755 $(@D)/src/useradd $(TARGET_DIR)/usr/sbin/
	install -m 0755 $(@D)/src/groupadd $(TARGET_DIR)/usr/sbin/
endef

endif

$(eval $(autotools-package))
