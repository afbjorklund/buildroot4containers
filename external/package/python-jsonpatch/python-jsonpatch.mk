################################################################################
#
# python-jsonpatch
#
################################################################################

PYTHON_JSONPATCH_VERSION = 1.32
PYTHON_JSONPATCH_SOURCE = jsonpatch-$(PYTHON_JSONPATCH_VERSION).tar.gz
PYTHON_JSONPATCH_SITE = https://files.pythonhosted.org/packages/21/67/83452af2a6db7c4596d1e2ecaa841b9a900980103013b867f2865e5e1cf0
PYTHON_JSONPATCH_SETUP_TYPE = setuptools
PYTHON_JSONPATCH_LICENSE = BSD
PYTHON_JSONPATCH_LICENSE_FILES = COPYING
HOST_PYTHON_JSONPATCH_DEPENDENCIES = host-python-jsonpointer

$(eval $(python-package))
