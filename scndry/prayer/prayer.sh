#!/bin/sh
year=2023
latitude="42.265"
longitude="-83.0283"
api="https://www.moonsighting.com/time_json.php?year=$year&tz=America/Toronto&lat=$latitude&lon=$longitude&method=2&both=0&time=0"

json_file='prayer.json'

cron_file='out.cron'
cron_file_path="$HOME/git/scripts/res/"
cron_command='/home/u/git/scripts/auto/prayer-notify'

org_file='prayer.org'
org_file_path="$HOME/git/org/agenda/misc/"

tocal() { echo $1 | cut -d ' ' -f $2; }
parse() { jq ".times[$1].times.$2" $json_file|tr -d ' "'; }
show () { echo $day $fajr $sunrise $dhuhr $asr $maghrib $isha; }
h () { echo $1|cut -d ':' -f1; }
m () { echo $1|cut -d ':' -f2; }


cron () { 
  cday="`echo $day|cut -d ' ' -f2` `echo $day|cut -d ' ' -f1`"
  fajr="`m $fajr` `h $fajr` $cday"
  echo $fajr '*' $cron_command \"Fajr\"

  sunrise="`m $sunrise` `h $sunrise` $cday"
  echo $sunrise '*' $cron_command \"sunrise\"

  dhuhr="`m $dhuhr` `h $dhuhr` $cday"
  echo $dhuhr '*' $cron_command \"Duhr\"


  asr="`m $asr` `h $asr` $cday"
  echo $asr '*' $cron_command \"Asr\"


  maghrib="`m $maghrib` `h $maghrib` $cday"
  echo $maghrib '*' $cron_command \"Maghrib\"


  isha="`m $isha` `h $isha` $cday"
  echo $isha '*' $cron_command \"Isha\"
}


org () { 
  echo '* Fajr'
  echo "SCHEDULED: <`date +%Y-%m-%d --date="$day"` $fajr>"
  echo '* Sunrise'
  echo "SCHEDULED: <`date +%Y-%m-%d --date="$day"` $sunrise>"
  echo '* Duhr'
  echo "SCHEDULED: <`date +%Y-%m-%d --date="$day"` $dhuhr>"
  echo '* Asr'
  echo "SCHEDULED: <`date +%Y-%m-%d --date="$day"` $asr>"
  echo '* Maghrib'
  echo "SCHEDULED: <`date +%Y-%m-%d --date="$day"` $maghrib>"
  echo '* Isha'
  echo "SCHEDULED: <`date +%Y-%m-%d --date="$day"` $isha>"
}


replace () {
  /bin/cp $cron_file $cron_file_path/$cron_file
  /bin/cp $org_file $org_file_path/$org_file
}


icloud () { 
  cal=Prayer
  dur=15m
  al=1m

  # TODO (Potential bug) `'` usually gets tabbed when formatting the file.
  IFS='
'
  n=0
  prayers='Fajr Sunrise Duhr Asr Maghrib Isha'
  for i in `/bin/cat ./$cron_file`
  do
    d=`tocal $i 3`
    m=`tocal $i 4`

    H=`tocal $i 2`
    M=`tocal $i 1`

    n=$(($n%6+1))
    prayer=`echo $prayers | cut -d ' ' -f $n`

    khal new -a $cal -m 0m $d-$m-$year $H:$M $dur $prayer
    echo -n "[\033[1;32mVdir\033[0m] $d-$m-$year $H:$M $dur $prayer\n"
  done

}


curl $api | json_pp | tee $json_file
sed -i '/asr_./d' $json_file        

for i in `seq 0 364`
do
  day=`jq ".times[$i].day" $json_file|tr -d '"'|cut -d ' ' -f 1,2|tr '[:upper:]' '[:lower:]'`

  fajr=`parse $i 'fajr'`
  sunrise=`parse $i 'sunrise'`
  dhuhr=`parse $i 'dhuhr'`
  asr=`parse $i 'asr'`
  maghrib=`parse $i 'maghrib'`
  isha=`parse $i 'isha'`

  show
  cron >> $cron_file
  org >> $org_file

  replace 
done

vdirsyncer discover
vdirsyncer sync
icloud
vdirsyncer sync
