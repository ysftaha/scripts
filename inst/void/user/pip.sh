#!/usr/bin/sh
. ../func.sh

und "Downloading and installing pip/npm/gem packages"
while read pkg
do
  command pip install --user $pkg
done < $1
