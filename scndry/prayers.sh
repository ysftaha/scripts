#!/bin/sh
# 1) `pdftotext -layout prayers.pdf`
# 2) manually remove evheaders
# 3) pass it to this script

filter() {
	date=`echo "$1"    | cut -d ' ' -f 1`
	day=`echo $date    | cut -d '-' -f 1`
	month=`echo $date  | cut -d '-' -f 2`
	fajir=`echo "$1"   | cut -d ' ' -f 2`
	sunrise=`echo "$1" | cut -d ' ' -f 3`
	duhr=`echo "$1" 	 | cut -d ' ' -f 4`
	asr=`echo "$1" 		 | cut -d ' ' -f 5`
	maghrib=`echo "$1" | cut -d ' ' -f 6`
	isha=`echo "$1" 	 | cut -d ' ' -f 7`
	
	#khal new -a Prayer $day/$month/2021 $fajir 	 am 15m Fajir
	#khal new -a Prayer $day/$month/2021 $sunrise am 15m Sunrise
	#khal new -a Prayer $day/$month/2021 $duhr 	 pm 15m Duhr
	#khal new -a Prayer $day/$month/2021 $asr   	 pm 15m Asr
	#khal new -a Prayer $day/$month/2021 $maghrib pm 15m Maghrib
	#khal new -a Prayer $day/$month/2021 $isha 	 pm 15m Isha

	echo "$fajir $sunrise $duhr $asr $maghrib $isha"
	echo -e "[\033[1;32mdone\033[0m] $date-2021"
}

while read line
do
	filter "$line"
done < $1
vdirsyncer sync