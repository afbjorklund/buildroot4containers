#!/bin/sh
exec rootlesskit --net=slirp4netns --copy-up=/etc --disable-host-loopback buildkitd $@
