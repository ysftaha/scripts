#!/usr/bin/sh
. ../func.sh

while read -r pkg
do
  command cpanm install "$pkg"
done < cpanm.txt 
