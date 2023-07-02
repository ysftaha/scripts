#! /bin/sh
# package installation script. Run this as root.
. ../func.sh

und "Setting up WIFI"
command ln -s /etc/sv/wpa_supplicant /var/service
command cp /mnt/home/git/conf/config/etc/wpa_supplicant/wpa_supplicant-wlp2s0.conf /etc/wpa_supplicant/
command sv restart wpa_supplicant
command sv restart dhcpcd
und "Waiting for services to restart"
command sleep 30s

# update
xbps-install -y -Su xbps

# repos
und "Adding non free repo for intel microcode package (intel-ucode)"
command xbps-install -y void-repo-nonfree
#command "xbps-install -y void-repo-multilib-nonfree"

und "Adding Void free repo"
command xbps-install -y void-repo-multilib
command xbps-install -S

und "Installing packages"
# packages
while read -r pkg
do
	command xbps-install -y "$pkg"
done < pkgs.txt

und "Rebuilding itramfs for intel microcode"
command "xbps-reconfigure -f linux"

und "Configuring packages"
command modprobe acpi_call
command xdg-user-dirs-update
