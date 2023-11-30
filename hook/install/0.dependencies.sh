#!/bin/bash -euf

# Install dependencies

if ! which qemu-system-x86_64 > /dev/null; then
	apt install qemu-kvm > /dev/null

	printf "qemu-kvm: installed\n"
else
	printf "qemu-kvm: already installed\n"
fi

if ! which socat > /dev/null; then
	apt install socat > /dev/null

	printf "socat: installed\n"
else
	printf "socat: already installed\n"
fi

if ! which daemonize > /dev/null; then
	apt install daemonize > /dev/null

	printf "daemonize: installed\n"
else
	printf "daemonize: already installed\n"
fi

if ! which sensors > /dev/null; then
	apt install lm-sensors > /dev/null

	printf "lm-sensors: installed\n"
else
	printf "lm-sensors: already installed\n"
fi

if ! which tree > /dev/null; then
	apt install tree > /dev/null

	printf "tree: installed\n"
else
	printf "tree: already installed\n"
fi

# Make sure dependencies really are installed
which qemu-system-x86_64 > /dev/null
which socat > /dev/null
which daemonize > /dev/null
which sensors > /dev/null
which tree > /dev/null
