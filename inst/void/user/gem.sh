#!/usr/bin/sh
. ../func.sh

while read -r pkg
do
  command gem install "$pkg"
done < gem.txt
