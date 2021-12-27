#! /usr/bin/sh
. ../func.sh

und "Installing zplug"
command "curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh"
