#!/usr/bin/sh
. ../func.sh
while read pkg
do
  command sudo npm install -location=global $pkg
done < $1
