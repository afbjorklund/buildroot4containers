################################################################################
#
# cloud-utils
#
################################################################################

CLOUD_UTILS_VERSION = 0.32
CLOUD_UTILS_SITE = $(call github,canonical,cloud-utils,$(CLOUD_UTILS_VERSION))
CLOUD_UTILS_LICENSE = GPL-3.0
CLOUD_UTILS_LICENSE_FILES = LICENSE

define CLOUD_UTILS_REMOVE_UBUNTU
	rm $(@D)/bin/*ubuntu*
endef

CLOUD_UTILS_POST_PATCH_HOOKS += CLOUD_UTILS_REMOVE_UBUNTU

define CLOUD_UTILS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		-C $(@D)
endef

define CLOUD_UTILS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
endef

$(eval $(generic-package))
