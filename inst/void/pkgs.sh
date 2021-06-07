#! /bin/sh
# package installation script. Run this as root.

# update 
xbps-install -Su

# repos
xbps-install -y void-repo-nonfree         # for intel and nvidia proprietary 
                                          # drivers
xbps-install -y void-repo-multilib	      # 32-bit for 64
xbps-install -y void-repo-multilib-nonfree
xbps-install -S                           # sync

# packages
pkg=`cat $1`
for i in $pkg
do
	xbps-install -y $i
done

# Manpages
makewhatis

# Rebuilding intramfs for Intel Microcode
xbps-reconfigure -f linux$(uname -r | cut -d '.' -f 1,2) # regenerate intramfs
