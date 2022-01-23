################################################################################
#
# python3-requests
#
################################################################################

# Please keep in sync with package/python-requests/python-requests.mk
PYTHON3_REQUESTS_VERSION = 2.26.0
PYTHON3_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
PYTHON3_REQUESTS_SITE = https://files.pythonhosted.org/packages/e7/01/3569e0b535fb2e4a6c384bdbed00c55b9d78b5084e0fb7f4d0bf523d7670
PYTHON3_REQUESTS_SETUP_TYPE = setuptools
PYTHON3_REQUESTS_LICENSE = Apache-2.0
PYTHON3_REQUESTS_LICENSE_FILES = LICENSE
PYTHON3_REQUESTS_CPE_ID_VENDOR = python
PYTHON3_REQUESTS_CPE_ID_PRODUCT = requests
HOST_PYTHON3_REQUESTS_NEEDS_HOST_PYTHON = python3

$(eval $(python-package))
$(eval $(host-python-package))
