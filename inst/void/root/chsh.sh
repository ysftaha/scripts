#!/usr/bin/sh
. ../func.sh
command chsh -s `echo $1 | cut -d":" -f2` `echo $1 | cut -d":" -f1`
