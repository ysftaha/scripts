#!/usr/bin/sh
. ../func.sh

builddir="$HOME/git/.build"

cd "$builddir" || exit
for i in *
do
  if [ ! "$i" = "other" ] 
  then
    yellow "Building $i\n"
    cd "$builddir/$i" || exit
    make install
  fi
done
