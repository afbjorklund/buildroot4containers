################################################################################
#
# nerdctl
#
################################################################################

NERDCTL_VERSION = 0.12.0
NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
NERDCTL_LICENSE = Apache-2.0
NERDCTL_LICENSE_FILES = LICENSE

NERDCTL_GOMOD = github.com/containerd/nerdctl

NERDCTL_LDFLAGS = \
	-X $(NERDCTL_GOMOD)/pkg/version.Version=$(NERDCTL_VERSION)

# avoid "inconsistent vendoring"
NERDCTL_BUILD_OPTS = -mod=readonly
NERDCTL_GO_ENV = GOPROXY=

NERDCTL_BUILD_TARGETS = \
	cmd/nerdctl

NERDCTL_INSTALL_BINS = $(notdir $(NERDCTL_BUILD_TARGETS))

ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
NERDCTL_DEPENDENCIES += libapparmor
NERDCTL_TAGS += apparmor
endif

ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
NERDCTL_DEPENDENCIES += libseccomp host-pkgconf
NERDCTL_TAGS += seccomp
endif

$(eval $(golang-package))
