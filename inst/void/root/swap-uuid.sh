#!/bin/sh
. ../func.sh

grub=/etc/default/grub
fst=/etc/fstab

und "Adding resume kernel parameter to bootloader"
uuid=`/bin/grep swap $fst | cut -d" " -f1`
uuid="resume=$uuid"

echo "\n$uuid " >> $grub
 
vi -c $ $grub 
update-grub
