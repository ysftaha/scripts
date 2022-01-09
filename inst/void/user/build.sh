#!/usr/bin/sh
. ../func.sh

builddir=$1
for i in `ls $builddir`
do
  if [ ! $i = "other" ] 
  then
    yellow "Building $i\n"
    cd $builddir/$i  
    make install
  fi
done
