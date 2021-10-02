################################################################################
#
# cloud-init
#
################################################################################

CLOUD_INIT_VERSION = 21.3
CLOUD_INIT_SITE = $(call github,canonical,cloud-init,$(CLOUD_INIT_VERSION))
CLOUD_INIT_DEPENDENCIES = \
	host-python3-jinja2 \
	host-python3-pyyaml \
	host-python3-requests \
	host-python3-urllib3 \
	host-python3-chardet \
	host-python3-certifi \
	host-python3-idna
CLOUD_INIT_LICENSE = Apache-2.0
CLOUD_INIT_LICENSE_FILES = LICENSE-Apache2.0
CLOUD_INIT_SETUP_TYPE = distutils
CLOUD_INIT_BUILD_OPTS = \
	--distro gentoo
CLOUD_INIT_INSTALL_TARGET_OPTS = \
	--executable /usr/bin/python3 \
	--init-system sysvinit_openrc

$(eval $(python-package))
