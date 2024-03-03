#! /usr/bin/sh
. ../func.sh

dev=/dev/sda
user=u
und "Migrating external backup [ $dev ] to user [ $user ]"

command mount "$dev" /mnt
command rm /home/u/.* # TODO: Retest this (had a bug in June)
command cp -R /mnt/home/* /home/"$user"/
command mkdir /home/"$user"/.runtime

command chown -R "$user:$user" /home/"$user"

und "Fixing permissions and ownership for conf/config/etc directory"
command chown -R "root:root" /home/"$user"/git/conf/config/etc
command chmod -R 755 /home/"$user"/git/conf/config/etc
