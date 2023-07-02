#!/usr/bin/sh
. ../func.sh
while read -r pkg
do
  command npm install -g "$pkg"
done < npm.txt
