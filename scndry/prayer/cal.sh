#!/bin/sh
vdirsyncer discover
vdirsyncer sync

y=2022

cal=Prayer
dur=15m
al=1m

IFS='
'


parse() {
  echo $1 | cut -d ' ' -f $2
}

n=0
prayers='Fajir Sunrise Duhr Asr Maghrib Isha'
for i in `/bin/cat out.cron`
do
  d=`parse $i 3`
  m=`parse $i 4`

  H=`parse $i 2`
  M=`parse $i 1`

  n=$(($n%6+1))
  prayer=`echo $prayers | cut -d ' ' -f $n`

  khal new -a $cal -m 0m $d-$m-$y $H:$M $dur $prayer
  echo -n "[\033[1;32mVdir\033[0m] $d-$m-$y $H:$M $dur $prayer\n"
done

vdirsyncer sync
