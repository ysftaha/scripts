#! /usr/bin/sh
. ../func.sh

username=u
conf_repo="/home/$username/git/conf"
username=$(echo "$conf_repo" | cut -d "/" -f3)
conf="/home/$username/.config"

und "Symbolic linking configuration repository"
mkdir "$conf"

for file in "$conf_repo"/config/*
do
   command ln -frs "$file" "$conf"
done

link() {
  cd "$conf"/"$1" || exit 
  find . -type d -print | while read -r i
  do
    i="$2${i##.}"
    [ "${i##.}" != "" ] && mkdir -p "$i"
  done

  find . -type f -print | while read -r i
  do
    i="${i##.}"
    ln -fs "$conf/$1$i" "$2$i"
  done
}

und "Symbolic linking NON-XDG_CONFIG_HOME files"
command "link etc /etc"
#command "link local /home/$username/.local"
#command "link vim /home/$username/.vim"
