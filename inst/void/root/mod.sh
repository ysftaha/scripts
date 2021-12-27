#!/bin/sh
. ../func.sh

str="echo REMINDER: modprobe "
while read mod
do
  str="$str $mod"
done < $2
echo $str >> $1 
