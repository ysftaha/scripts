#!/usr/bin/sh
. ../func.sh
und "GTK theme installation"
command unzip ../Arc-BLACKEST_1.3.zip
command doas mv Arc-BLACKEST/ /usr/share/themes/
command xdg-user-dirs-update
