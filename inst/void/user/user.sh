#! /usr/bin/sh
. ../func.sh
# TODO: Migrate ~/.local/{package manager shit} to ~/.local/share like ruby 

sh build.sh 
sh cpanm.sh 
sh doom.sh 
sh gtk-theme.sh
sh pip.sh
sh npm.sh
sh gem.sh
sh nvim.sh
