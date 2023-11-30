#!/bin/bash -euf

# Validate UUIDs
blkid | grep -q "$ANIO_SH_SSD_UUID"
blkid | grep -q "$ANIO_SH_HDD_UUID"

# RAM Disk
[ ! -d "/mnt/anio_tmpfs" ] && mkdir /mnt/anio_tmpfs

if ! grep -q "/mnt/anio_tmpfs" "/etc/fstab"; then
	printf "# RAM Disk\n" >> /etc/fstab
	printf "tmpfs                                     /mnt/anio_tmpfs  tmpfs  rw,mode=1777,size=1g\n" >> /etc/fstab

	printf "/mnt/anio_tmpfs: created entry in fstab\n"
else
	printf "/mnt/anio_tmpfs: already created\n"
fi

# Fast Data Storage
[ ! -d "/mnt/anio_ssd" ] && mkdir /mnt/anio_ssd

if ! grep -q "/mnt/anio_ssd" "/etc/fstab"; then
	printf "# Fast Data Storage\n" >> /etc/fstab
	printf "UUID=$ANIO_SH_SSD_UUID /mnt/anio_ssd    ext4   auto,noexec,nouser,rw,sync,nosuid,errors=remount-ro 0 2\n" >> /etc/fstab

	printf "/mnt/anio_ssd: created entry in fstab\n"
else
	printf "/mnt/anio_ssd: already created\n"
fi

# Slow Data Storage
[ ! -d "/mnt/anio_hdd" ] && mkdir /mnt/anio_hdd

if ! grep -q "/mnt/anio_hdd" "/etc/fstab"; then
	printf "# Slow Data Storage\n" >> /etc/fstab
	printf "UUID=$ANIO_SH_HDD_UUID /mnt/anio_hdd    ext4   auto,noexec,nouser,rw,sync,nosuid,errors=remount-ro 0 2\n" >> /etc/fstab

	printf "/mnt/anio_hdd: created entry in fstab\n"
else
	printf "/mnt/anio_hdd: already created\n"
fi
