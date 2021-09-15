

all: iso

BUILDROOT_BRANCH = 2020.02.x

BUILDROOT_OPTIONS = BR2_EXTERNAL=$(PWD)/external

buildroot:
	git clone --single-branch --branch=$(BUILDROOT_BRANCH) \
	          --no-tags --depth=1 https://github.com/buildroot/buildroot

buildroot/.config: buildroot buildroot_defconfig kernel_defconfig
	cp buildroot_defconfig buildroot/.config
	$(MAKE) -C buildroot $(BUILDROOT_OPTIONS) olddefconfig

# buildroot/dl
download: buildroot/.config
	$(MAKE) -C buildroot $(BUILDROOT_OPTIONS) source

.PHONY: clean
clean:
	rm -f buildroot/.config
	$(MAKE) -C buildroot $(BUILDROOT_OPTIONS) clean

# buildroot/output
iso: buildroot/.config
	$(MAKE) -C buildroot $(BUILDROOT_OPTIONS) all
	@mkdir -p output
	cp buildroot/output/images/rootfs.iso9660 output/buildroot.iso

disk.img:
	qemu-img create -f qcow2 $@ 20g

data.img:
	qemu-img create -f qcow2 $@ 5g

run: output/buildroot.iso disk.img
	test -e /dev/kvm && kvm=-enable-kvm; \
	net="-net nic,model=virtio -net user"; \
	test -e data.img && hdb="-hdb data.img"; \
	test -e images.iso && hdd="-hdd images.iso"; \
	qemu-system-x86_64 $$kvm -M pc -smp 1 -m 1024 $$net \
	-cdrom output/buildroot.iso -hda disk.img $$hdb $$hdd -boot d

graph-size.pdf:
	$(MAKE) -C buildroot graph-size
	cp buildroot/output/graphs/graph-size.pdf $@

graph-size.png: graph-size.pdf
	pdftoppm <$< | pnmtopng >$@

KUBEADM = kubeadm
DOCKER = docker

GOOS = linux
GOARCH = amd64

# /etc/kubernetes/flannel.yml
# https://raw.githubusercontent.com/coreos/flannel/v0.12.0/Documentation/kube-flannel.yml

images.txt:
	echo $$DOCKER
	$(KUBEADM) config images list > $@
	echo "quay.io/coreos/flannel:v0.12.0-$(GOARCH)" >> $@

images: images.txt
	xargs -n 1 $(DOCKER) pull < $<
	for image in $$(cat $<); do \
	file=$$(echo $$image | sed -e 's/:/_/'); \
	mkdir -p images/$$(dirname $$file); \
	$(DOCKER) save $$image | pigz > images/$$file; done

images.txz: images.txt
	xargs -n 1 $(DOCKER) pull < $<
	xargs $(DOCKER) save < $< | pixz > $@

images.iso: images.txt images.txz
	genisoimage -output $@ $^

PYTHON = python

FORMAT = '{{.VirtualSize}}'

sizes.txt: images.txt
	xargs -n 1 $(DOCKER) images --format $(FORMAT) < $< > $@

image-size.png: images.txt sizes.txt
	$(PYTHON) image-size.py $^ $@

image-size.pdf: images.txt sizes.txt
	$(PYTHON) image-size.py $^ $@

# reference board
qemu_x86_64: buildroot
	$(MAKE) -C buildroot qemu_x86_64_defconfig
	$(MAKE) -C buildroot world
	@mkdir -p output/images
	cp buildroot/output/images/bzImage output/images/
	cp buildroot/output/images/rootfs.ext2 output/images/
