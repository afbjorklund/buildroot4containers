################################################################################
#
# rootlesskit
#
################################################################################

ROOTLESSKIT_VERSION = 0.14.5
ROOTLESSKIT_SITE = $(call github,rootless-containers,rootlesskit,v$(ROOTLESSKIT_VERSION))
ROOTLESSKIT_LICENSE = Apache-2.0
ROOTLESSKIT_LICENSE_FILES = LICENSE

# avoid "inconsistent vendoring"
ROOTLESSKIT_BUILD_OPTS = -mod=readonly
ROOTLESSKIT_GO_ENV = GOPROXY=

ROOTLESSKIT_BUILD_TARGETS = \
	cmd/rootlesskit \
	cmd/rootlessctl

ROOTLESSKIT_INSTALL_BINS = $(notdir $(ROOTLESSKIT_BUILD_TARGETS))

$(eval $(golang-package))
