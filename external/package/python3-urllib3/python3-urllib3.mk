################################################################################
#
# python3-urllib3
#
################################################################################

# Please keep in sync with package/python-urllib3/python-urllib3.mk
PYTHON3_URLLIB3_VERSION = 1.26.6
PYTHON3_URLLIB3_SOURCE = urllib3-$(PYTHON3_URLLIB3_VERSION).tar.gz
PYTHON3_URLLIB3_SITE = https://files.pythonhosted.org/packages/4f/5a/597ef5911cb8919efe4d86206aa8b2658616d676a7088f0825ca08bd7cb8
PYTHON3_URLLIB3_LICENSE = MIT
PYTHON3_URLLIB3_LICENSE_FILES = LICENSE.txt
PYTHON3_URLLIB3_CPE_ID_VENDOR = python
PYTHON3_URLLIB3_CPE_ID_PRODUCT = urllib3
PYTHON3_URLLIB3_SETUP_TYPE = setuptools
HOST_PYTHON3_URLLIB3_DL_SUBDIR = python-urllib3
HOST_PYTHON3_URLLIB3_NEEDS_HOST_PYTHON = python3

$(eval $(host-python-package))