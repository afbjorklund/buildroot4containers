#!/bin/sh

set -e

BOARD_DIR=$(dirname "$0")

TARGET_DIR="$1"
test -n "$TARGET_DIR" || exit 1

# change system users to have UID and GID below 1000

PASSWD="${TARGET_DIR}/etc/passwd"
GROUP="${TARGET_DIR}/etc/group"

# 	sshd -1 sshd -1 * /var/empty - - SSH drop priv user

uid=999
gid=999

sed -e "s/^sshd:x:[0-9]*:[0-9]*/sshd:x:${uid}:${gid}/" -i "${PASSWD}"
sed -e "s/^sshd:x:[0-9]*/sshd:x:${gid}/" -i "${GROUP}"

# 	- - sudo -1 - - - -

sed -e "s/^sudo:x:[0-9]*/sudo:x:200/" -i "${GROUP}"
