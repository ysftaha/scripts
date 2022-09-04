#! /usr/bin/sh
. ../func.sh

sh build.sh "$HOME/git/.build"

sh cpanm.sh cpanm.txt

sh doom.sh 

sh gtk-theme.sh

sh pip.sh pip.txt

sh npm.sh npm.txt

sh gem.sh gem.txt

sh ungoogled-chromium.sh

sh nvim.sh
