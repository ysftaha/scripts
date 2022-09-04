#!/bin/sh
IFS='
'
split() {
  m=`echo $1 | cut -d' ' -f2`
  h=`echo $1 | cut -d' ' -f1`
  echo -n $m $h
}

hourf() {
  m=`echo $1 | cut -d' ' -f1`
  h=`echo $1 | cut -d' ' -f2`
  [ $h -ne 12 ] && h=$(($h + 12)) # Conitional for Duhr @ 12pm
  echo -n $m $h
}

for j in `cat doc.txt`
do
  t=`echo $j | cut -d' ' -f1 | sed 's/-/ /'`

  f=`echo $j | cut -d' ' -f2 | sed 's/:/ /'`
  f=`split $f`

  s=`echo $j | cut -d' ' -f3 | sed 's/:/ /'`
  s=`split $s`

  d=`echo $j | cut -d' ' -f4 | sed 's/:/ /'`
  d=`split $d`
  d=`hourf $d` 

  a=`echo $j | cut -d' ' -f5 | sed 's/:/ /'`
  a=`split $a`
  a=`hourf $a`

  m=`echo $j | cut -d' ' -f6 | sed 's/:/ /'`
  m=`split $m`
  m=`hourf $m`

  i=`echo $j | cut -d' ' -f7 | sed 's/:/ /'`
  i=`split $i`
  i=`hourf $i`

  echo $f $t '* /home/u/git/scripts/auto/prayer "fajir"'   >> out.cron
  echo $s $t '* /home/u/git/scripts/auto/prayer "sunrise"' >> out.cron
  echo $d $t '* /home/u/git/scripts/auto/prayer "duhr"'    >> out.cron
  echo $a $t '* /home/u/git/scripts/auto/prayer "asr"'     >> out.cron
  echo $m $t '* /home/u/git/scripts/auto/prayer "maghrib"' >> out.cron
  echo $i $t '* /home/u/git/scripts/auto/prayer "isha"'    >> out.cron
done
