################################################################################
#
# buildkit
#
################################################################################

BUILDKIT_VERSION = 0.9.0
BUILDKIT_SITE = $(call github,moby,buildkit,v$(BUILDKIT_VERSION))
BUILDKIT_LICENSE = Apache-2.0
BUILDKIT_LICENSE_FILES = LICENSE

BUILDKIT_GOMOD = github.com/moby/buildkit

BUILDKIT_LDFLAGS = \
	-X $(BUILDKIT_GOMOD)/version.Version=$(BUILDKIT_VERSION)

BUILDKIT_BUILD_TARGETS = \
	cmd/buildkitd \
	cmd/buildctl

BUILDKIT_INSTALL_BINS = $(notdir $(BUILDKIT_BUILD_TARGETS))

ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
BUILDKIT_DEPENDENCIES += libapparmor
BUILDKIT_TAGS += apparmor
endif

ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
BUILDKIT_DEPENDENCIES += libseccomp host-pkgconf
BUILDKIT_TAGS += seccomp
endif

$(eval $(golang-package))
