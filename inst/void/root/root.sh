#! /usr/bin/sh
. ../func.sh

# Add user with groups
sh userp.sh "u:wheel,audio,disk,socklog"

# Elevate wheel group privelages
sh wheelp.sh

# Migrate backup to user
sh migrate.sh "/dev/sda:u"

# Creating config symbolic links for config repository
# (some configs might be linked globaly in etc)
sh link.sh "/home/u/git/conf"

# Add resume partition uuid to bootloader parameters
sh swap-uuid.sh 

# Install xbps-packages
sh pkgs.sh pkgs.txt

# Enable runit services
sh srvcs.sh srvcs.txt

# Cron jobs
sh cron.sh "../cron/"

# chown home directory recursively except for .config/etc/ which is owned by
# root for symbolic linking purposes
sh chn.sh "u:u"

und "Changing user default shell to zsh"
sh chsh.sh "u:/usr/bin/zsh"
