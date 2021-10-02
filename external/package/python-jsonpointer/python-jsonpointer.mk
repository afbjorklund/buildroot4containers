################################################################################
#
# python-jsonpointer
#
################################################################################

PYTHON_JSONPOINTER_VERSION = 2.1
PYTHON_JSONPOINTER_SOURCE = jsonpointer-$(PYTHON_JSONPOINTER_VERSION).tar.gz
PYTHON_JSONPOINTER_SITE = https://files.pythonhosted.org/packages/6b/35/400557d3df63269a4c010cbd4865910b3c1718fbfe8d83210b216cd3efcf
PYTHON_JSONPOINTER_SETUP_TYPE = setuptools
PYTHON_JSONPOINTER_LICENSE = BSD
PYTHON_JSONPOINTER_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
