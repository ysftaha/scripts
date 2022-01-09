#!/usr/bin/sh
. ../func.sh
gem install neovim
while read pkg
do
  command gem install $pkg
done < $1
