#! /usr/bin/sh
. ../func.sh

und "Enabling runit services"
while read srvc
do
  command ln -s /etc/sv/$srvc /var/service
done < $1
