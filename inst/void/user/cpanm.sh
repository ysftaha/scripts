#!/usr/bin/sh
. ../func.sh

for i in `cat $1`
do
  cpanm --force --sudo $i
done

command sudo rm -r $HOME/.cpanm $HOME/.cpan $HOME/perl5
