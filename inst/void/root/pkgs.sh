#! /bin/sh
# package installation script. Run this as root.
. ../func.sh

# update
xbps-install -Su

# repos
und "Adding non free repo for intel microcode package (intel-ucode)"
command xbps-install -y void-repo-nonfree
#command "xbps-install -y void-repo-multilib-nonfree"

und "Adding Void free repo"
command xbps-install -y void-repo-multilib
command xbps-install -S

und "Downloading packages"
# packages
pkg=`cat $1`
for i in $pkg
do
	command xbps-install -y $i
done

und "Rebuilding itramfs for intel microcode"
command xbps-reconfigure -f linux$(uname -r | cut -d '.' -f 1,2)

command modprobe acpi_call
