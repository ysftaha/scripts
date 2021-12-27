#!/bin/sh
. ../func.sh

grub=/etc/default/grub
fst=/etc/fstab

und "Pointing grub to wakeup resume partition"

uuid=`/bin/grep swap $fst | cut -d" " -f1`
uuid="resume=$uuid"
echo "\n" >> $grub
command echo "# Add to GRUB_CMDLINE_LINUX_DEFAULT" >> $grub
echo $uuid >> $grub
 
vi -c $ $grub 
update-grub
