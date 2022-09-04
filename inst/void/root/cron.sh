#!/usr/bin/sh
. ../func.sh
cronp="/etc"

und "Symlinking cron jobs"
for i in `ls $1`
do
  ln -frs $1/$i $cronp/cron.`echo $i | cut -d"." -f2`/
done

und "Adding prayer decorators in crontab file"
touch tmp.txt
echo '# PRAYER START\n# PRAYER END' > tmp.txt
crontab tmp.txt
rm tmp.txt
