

all: zip

BUILDROOT_BRANCH = 2021.08.x

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

img: output/disk.img
zip: output/disk.img.gz

# buildroot/output
output/disk.img: buildroot/.config
	$(MAKE) -C buildroot $(BUILDROOT_OPTIONS) all
	@mkdir -p output
	cp buildroot/output/images/disk.img output/disk.img

output/disk.img.gz: output/disk.img
	cd output && gzip -9 >disk.img.gz <disk.img

disk.img:
	qemu-img convert -f raw -O qcow2 output/disk.img $@
	qemu-img resize $@ 20G

data.img:
	qemu-img create -f qcow2 $@ 5g

run: disk.img
	test -e /dev/kvm && kvm=-enable-kvm; \
	net="-net nic,model=virtio -net user"; \
	rng="-device virtio-rng-pci,max-bytes=1024,period=1000" \
	test -e data.img && hdb="-hdb data.img"; \
	test -e images.iso && hdd="-hdd images.iso"; \
	qemu-system-x86_64 $$kvm -M pc -smp 1 -m 1024 $$net $$rng \
	-drive file=disk.img,if=virtio $$hdb $$hdd -boot c

graph-size.pdf:
	$(MAKE) -C buildroot graph-size
	cp buildroot/output/graphs/graph-size.pdf $@

graph-size.png: graph-size.pdf
	pdftoppm <$< | pnmtopng >$@

# reference board
pc_x86_64_bios: buildroot
	$(MAKE) -C buildroot pc_x86_64_bios_defconfig
	$(MAKE) -C buildroot world
	@mkdir -p output/images
	cp buildroot/output/images/bzImage output/images/
	cp buildroot/output/images/rootfs.ext2 output/images/
