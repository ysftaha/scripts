#!/usr/bin/sh
cronp="/etc"

und "Symlinking cron jobs"
for i in `ls $1`
do
  ln -frs $1/$i $cronp/cron.`echo $i | cut -d"." -f2`/
done
