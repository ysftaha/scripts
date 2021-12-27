#! /usr/bin/sh

command() {
  tput bold
  echo "$@"
  tput sgr0
  eval $@
}

und() {
  tput smul
  echo "$@"
  tput rmul
}

yellow() {
  tput setaf 3
  printf "$@"
  tput sgr0
}

info() {
  echo "[\033[1;34m$@\033[0m]" 
}
