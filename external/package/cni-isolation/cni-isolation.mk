################################################################################
#
# cni-isolation
#
################################################################################

CNI_ISOLATION_VERSION = 0.0.4
CNI_ISOLATION_SITE = $(call github,AkihiroSuda,cni-isolation,v$(CNI_ISOLATION_VERSION))
CNI_ISOLATION_LICENSE = Apache-2.0

CNI_ISOLATION_MAKE_ENV = \
	$(GO_TARGET_ENV) \
	CGO_ENABLED=0

CNI_ISOLATION_PROGRAMS += isolation

define CNI_ISOLATION_BUILD_CMDS
	(cd $(@D); $(CNI_ISOLATION_MAKE_ENV) $(MAKE) binary $(CNI_ISOLATION_BUILDFLAGS))
endef

define CNI_ISOLATION_INSTALL_TARGET_CMDS
	cd $(@D); for program in $(CNI_ISOLATION_PROGRAMS); do \
		bin=bin/$$program; \
		$(INSTALL) -D -m 0755 \
			$(@D)/$$bin \
			$(TARGET_DIR)/opt/cni/$$bin; \
		ln -sf \
			../../opt/cni/$$bin \
			$(TARGET_DIR)/usr/$$bin; \
	done
endef

$(eval $(generic-package))
