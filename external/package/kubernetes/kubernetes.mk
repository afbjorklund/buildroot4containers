################################################################################
#
# kubernetes
#
################################################################################

KUBERNETES_VERSION = 1.18.3
KUBERNETES_SITE = https://storage.googleapis.com/kubernetes-release/release/v$(KUBERNETES_VERSION)/bin/linux/amd64
KUBERNETES_LICENSE = Apache-2.0

KUBERNETES_SOURCE = kubeadm
KUBERNETES_EXTRA_DOWNLOADS = kubelet kubectl

KUBERNETES_ACTUAL_SOURCE_SITE = https://github.com/kubernetes/kubernetes/archive
KUBERNETES_ACTUAL_SOURCE_TARBALL = v$(KUBERNETES_VERSION).tar.gz

# See https://github.com/kubernetes/release
KUBERNETES_KUBEPKG_RELEASE_VERSION = v0.3.2

define KUBERNETES_EXTRACT_CMDS
endef

define KUBERNETES_BUILD_CMDS
endef

define KUBERNETES_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0755 $(KUBERNETES_DL_DIR)/kubeadm $(TARGET_DIR)/usr/bin
$(INSTALL) -D -m 0755 $(KUBERNETES_DL_DIR)/kubelet $(TARGET_DIR)/usr/bin
$(INSTALL) -D -m 0755 $(KUBERNETES_DL_DIR)/kubectl $(TARGET_DIR)/usr/bin
endef

define KUBERNETES_INSTALL_INIT_SYSTEMD
	# "https://raw.githubusercontent.com/kubernetes/release/$(KUBERNETES_KUBEPKG_RELEASE_VERSION)/cmd/kubepkg/templates/latest/deb/kubelet/lib/systemd/system/kubelet.service"
	$(INSTALL) -D -m 0644 $(KUBERNETES_PKGDIR)/kubelet.service \
		$(TARGET_DIR)/usr/lib/systemd/system/kubelet.service

	# "https://raw.githubusercontent.com/kubernetes/release/$(KUBERNETES_KUBEPKG_RELEASE_VERSION)/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubeadm.conf"
	$(INSTALL) -D -m 0644 $(KUBERNETES_PKGDIR)/kubelet.service.d/10-kubeadm.conf \
		$(TARGET_DIR)/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf
endef

$(eval $(generic-package))