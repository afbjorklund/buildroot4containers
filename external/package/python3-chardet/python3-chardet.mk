################################################################################
#
# python3-chardet
#
################################################################################

# Please keep in sync with package/python-chardet/python-chardet.mk
PYTHON3_CHARDET_VERSION = 4.0.0
PYTHON3_CHARDET_SOURCE = chardet-$(PYTHON3_CHARDET_VERSION).tar.gz
PYTHON3_CHARDET_SITE = https://files.pythonhosted.org/packages/ee/2d/9cdc2b527e127b4c9db64b86647d567985940ac3698eeabc7ffaccb4ea61
PYTHON3_CHARDET_SETUP_TYPE = setuptools
PYTHON3_CHARDET_LICENSE = LGPL-2.1+
PYTHON3_CHARDET_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
