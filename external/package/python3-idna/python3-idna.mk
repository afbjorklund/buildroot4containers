################################################################################
#
# python3-idna
#
################################################################################

# Please keep in sync with package/python-idna/python-idna.mk
PYTHON3_IDNA_VERSION = 3.2
PYTHON3_IDNA_SOURCE = idna-$(PYTHON3_IDNA_VERSION).tar.gz
PYTHON3_IDNA_SITE = https://files.pythonhosted.org/packages/cb/38/4c4d00ddfa48abe616d7e572e02a04273603db446975ab46bbcd36552005
PYTHON3_IDNA_LICENSE = BSD-3-Clause
PYTHON3_IDNA_LICENSE_FILES = LICENSE.md
PYTHON3_IDNA_SETUP_TYPE = setuptools

$(eval $(host-python-package))
