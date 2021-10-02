################################################################################
#
# python3-jsonpointer
#
################################################################################

PYTHON3_JSONPOINTER_VERSION = 2.1
PYTHON3_JSONPOINTER_SOURCE = jsonpointer-$(PYTHON_JSONPOINTER_VERSION).tar.gz
PYTHON3_JSONPOINTER_SITE = https://files.pythonhosted.org/packages/6b/35/400557d3df63269a4c010cbd4865910b3c1718fbfe8d83210b216cd3efcf
PYTHON3_JSONPOINTER_SETUP_TYPE = setuptools
PYTHON3_JSONPOINTER_LICENSE = BSD
PYTHON3_JSONPOINTER_LICENSE_FILES = LICENSE.txt
HOST_PYTHON3_JSONPOINTER_DL_SUBDIR = python-jsonpointer
HOST_PYTHON3_JSONPOINTER_NEEDS_HOST_PYTHON = python3

$(eval $(host-python-package))
