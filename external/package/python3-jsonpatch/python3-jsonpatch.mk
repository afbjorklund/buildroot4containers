################################################################################
#
# python3-jsonpatch
#
################################################################################

PYTHON3_JSONPATCH_VERSION = 1.32
PYTHON3_JSONPATCH_SOURCE = jsonpatch-$(PYTHON3_JSONPATCH_VERSION).tar.gz
PYTHON3_JSONPATCH_SITE = https://files.pythonhosted.org/packages/21/67/83452af2a6db7c4596d1e2ecaa841b9a900980103013b867f2865e5e1cf0
PYTHON3_JSONPATCH_SETUP_TYPE = setuptools
PYTHON3_JSONPATCH_LICENSE = BSD
PYTHON3_JSONPATCH_LICENSE_FILES = COPYING
HOST_PYTHON3_JSONPATCH_DL_SUBDIR = python-jsonpatch
HOST_PYTHON3_JSONPATCH_NEEDS_HOST_PYTHON = python3

$(eval $(host-python-package))
