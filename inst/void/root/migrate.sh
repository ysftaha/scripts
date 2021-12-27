#! /usr/bin/sh
. ../func.sh

und "Migrating external backup to user"

dev=`echo $1 | cut -d":" -f1`
u=`echo $1 | cut -d":" -f2`
echo $dev
echo $u

command mount $dev /mnt
command cp -R /mnt/home/* /home/$u/
