################################################################################
#
# python3-configobj
#
################################################################################

# Please keep in sync with package/python-configobj/python-configobj.mk
PYTHON3_CONFIGOBJ_VERSION = 5.0.6
PYTHON3_CONFIGOBJ_SOURCE = configobj-$(PYTHON3_CONFIGOBJ_VERSION).tar.gz
PYTHON3_CONFIGOBJ_SITE = https://pypi.python.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab
PYTHON3_CONFIGOBJ_LICENSE = BSD-3-Clause
# License only mentioned in the source
PYTHON3_CONFIGOBJ_SETUP_TYPE = distutils

$(eval $(python-package))
