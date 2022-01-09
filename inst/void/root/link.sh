#! /usr/bin/sh
. ../func.sh

username=`echo $1 | cut -d "/" -f3`
conf="/home/$username/.config"

und "Symbolic linking configuration repository"
mkdir $conf
for file in `ls $1/config`
do
  command "ln -frs $1/config/$file $conf"
done

# mkdir -p | confpath | rename
entry() {
  echo "$line" | tr -d "[:blank:]" | cut -d "|" -f $1
}

while read line
do
  [ ! -z `entry 1` ] && [ ! -d `entry 3` ] && command mkdir -p `entry 3`
  command ln -s $conf/`entry 2` `entry 3`
  [ ! -z `entry 4` ] && command rename `entry 3`/`entry 2` `entry 3`/`entry 4` `entry 3`/`entry 2`
done < $conf/links.txt
