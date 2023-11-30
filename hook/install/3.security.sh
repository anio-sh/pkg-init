#!/bin/bash -euf

# needed to make running vm as non-root user work
if ! grep -q "@anio_vfio" "/etc/security/limits.conf"; then
	printf "\n" >> /etc/security/limits.conf
	printf "%s\n" "@anio_vfio    hard    memlock        9000000" >> /etc/security/limits.conf
	printf "%s\n" "@anio_vfio    soft    memlock        9000000" >> /etc/security/limits.conf
else
	printf "/etc/security/limits.conf: already created\n"
fi

# needed to make running vm as non-root user work
printf "SUBSYSTEM==\"vfio\", OWNER=\"root\", GROUP=\"kvm\"" > /etc/udev/rules.d/10-qemu-hw-users.rules

printf "/etc/udev/rules.d/10-qemu-hw-users.rules: created\n"
