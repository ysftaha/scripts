#!/usr/bin/sh
. ../func.sh

builddir=$1
for i in `ls $builddir`
do
  [ ! $i = "other" ] && cd $builddir/$i && make install
done
