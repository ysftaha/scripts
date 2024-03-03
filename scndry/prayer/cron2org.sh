#!/bin/sh

org () { 
  echo "* $prayer"
  echo "SCHEDULED: <$(date +%Y-%m-%d --date="$day") $time>"
}


while IFS= read -r line
do
  prayer=$(printf "%s" "$line"|rev|cut -d ' ' -f1|rev|tr -d '\"')
  day=$(printf "%s" "$line"|cut -d ' ' -f3-4)
  h=$(printf "%s" "$line"|cut -d ' ' -f2)
  m=$(printf "%s" "$line"|cut -d ' ' -f1)
  time="$h:$m"
  org >> out.org
done < "$1"
