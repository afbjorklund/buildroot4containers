################################################################################
#
# python3-certifi
#
################################################################################

# Please keep in sync with package/python-certifi/python-certifi.mk
PYTHON3_CERTIFI_VERSION = 2021.5.30
PYTHON3_CERTIFI_SOURCE = certifi-$(PYTHON3_CERTIFI_VERSION).tar.gz
PYTHON3_CERTIFI_SITE = https://files.pythonhosted.org/packages/6d/78/f8db8d57f520a54f0b8a438319c342c61c22759d8f9a1cd2e2180b5e5ea9
PYTHON3_CERTIFI_SETUP_TYPE = setuptools
PYTHON3_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
PYTHON3_CERTIFI_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
