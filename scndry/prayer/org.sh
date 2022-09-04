#!/bin/sh
IFS='
'
out=`pwd`/out.org

n=0
prayers='Fajir Sunrise Duhr Asr Maghrib Isha'
for i in `/bin/cat out.cron`
do
  n=$(($n%6+1))

  d=$(date +%Y-%m-%d --date="`echo $i | cut -d' ' -f 3,4`")
  t=$(echo $i | cut -d' ' -f 2):$(echo $i | cut -d ' ' -f 1)

  prayer=`echo $prayers | cut -d ' ' -f $n`

  echo "* $prayer" >> $out
  echo "SCHEDULED: <$d $t>" >> $out
done
