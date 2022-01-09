#!/bin/sh
# 1) `pdftotext -layout prayers.pdf`
# 2) manually remove evheaders 
# 3) change month names to numbers
# 4) single digit day numbers to double digits 
#    s/^\s\+\zs\ze\d-/0
# 5) pass it to this script

filter() {
	date=`echo "$1"    | cut -d ' ' -f 1`

  wday=`echo $1      | cut -d ' ' -f 2`
	day=`echo $date    | cut -d '-' -f 1`
	month=`echo $date  | cut -d '-' -f 2`

	fajir=`echo $1   | cut -d ' ' -f 5`
	sunrise=`echo $1 | cut -d ' ' -f 7`
	duhr=`echo $1 	 | cut -d ' ' -f 8`
	asr=`echo $1 		 | cut -d ' ' -f 10`
	maghrib=`echo $1 | cut -d ' ' -f 12`
	isha=`echo $1 	 | cut -d ' ' -f 14`
	
  org 
}

org() {
  echo "* $date">>$file
  echo "** fajir">>$file
  echo "SCHEDULED: <$year-$month-$day $fajir>">>$file

  a='duhr asr maghrib isha'
  for i in $a
  do
    eval "p=\$$i"
    echo "** $i">> $file
    echo "SCHEDULED: <$year-$month-$day ${p}pm>">>$file
  done

  echo "[\033[1;32mOrg\033[0m] $date-$year"
}

vdir() {
	#khal new -a Prayer $day/$month/2021 $fajir 	 am 15m Fajir
	#khal new -a Prayer $day/$month/2021 $sunrise am 15m Sunrise
	#khal new -a Prayer $day/$month/2021 $duhr 	 pm 15m Duhr
	#khal new -a Prayer $day/$month/2021 $asr   	 pm 15m Asr
	#khal new -a Prayer $day/$month/2021 $maghrib pm 15m Maghrib
	#khal new -a Prayer $day/$month/2021 $isha 	 pm 15m Isha
  echo -n "[\033[1;32mVdir\033[0m] $date-2021 "
  # vdirsyncer sync
}

year=2022
file=$2
while read line
do
	filter "$line"
done < $1
