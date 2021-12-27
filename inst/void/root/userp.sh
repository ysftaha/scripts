#! /usr/bin/sh
# NOTE: run as root
. ../func.sh

username=`echo $1 | cut -d":" -f 1`
groups=`echo $1 | cut -d":" -f 2`

und "Adding user and password groups: ($groups)"
command useradd -m -G $groups "$username"
command passwd $username
