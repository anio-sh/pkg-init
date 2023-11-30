#!/bin/bash -euf

printf "Updating apt packages index ...\n"

apt update > /dev/null 2> /dev/null
