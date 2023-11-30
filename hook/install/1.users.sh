#!/bin/bash -euf

declare -a anio_envs=("dev" "test" "prod")

if ! id "anio" > /dev/null; then
	# Create "anio" user
	useradd \
		-c "Anio Software" \
		-M \
		-s /usr/sbin/nologin \
		anio

	printf "anio: created user\n"
else
	printf "anio: user already created\n"
fi

groupadd -f anio_vfio

for anio_env in "${anio_envs[@]}"
do
	if ! id "anio_$anio_env" > /dev/null; then
		useradd \
			-c "Anio Software ($anio_env)" \
			-M \
			-s /usr/sbin/nologin \
			"anio_$anio_env"

		printf "anio_$anio_env: created user\n"

		usermod -a -G anio "anio_$anio_env"
		usermod -a -G kvm "anio_$anio_env"
		usermod -a -G anio_vfio "anio_$anio_env"
	else
		printf "anio_$anio_env: user already created\n"
	fi
done
