#!/bin/bash -euf

mount -a

printf "Validating mount points ...\n"

mountpoint "/mnt/anio_tmpfs"
mountpoint "/mnt/anio_ssd"
mountpoint "/mnt/anio_hdd"

printf "\n"
