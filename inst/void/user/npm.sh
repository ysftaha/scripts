#!/usr/bin/sh
. ../func.sh
while read pkg
do
  command npm install -g $pkg
done < $1
