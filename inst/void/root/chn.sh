#! /usr/bin/sh
. ../func.sh
und "Changing ownership of home directory of user (exception: .config/etc)"
chown -R $1 /home/`echo $1|cut -d":" -f1`

chown -R "root:root" /home/`echo $1|cut -d":" -f1`/.config/etc
