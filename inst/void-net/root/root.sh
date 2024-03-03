#! /usr/bin/sh
. ../func.sh

sh wifi.sh
sh pkgs.sh > pkgs.log

sh srvcs.sh > srvcs.log

sh sudoers.sh
sh userp.sh

sh migrate.sh
sh link.sh 

sh swap-uuid.sh 
sh timezone.sh
