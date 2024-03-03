. ../func.sh

und "Setting up WIFI"
command ln -s /etc/sv/wpa_supplicant /var/service
command ln -s /etc/sv/dhcpcd/ /var/service
command cp /mnt/home/git/conf/config/etc/wpa_supplicant/wpa_supplicant-wlp2s0.conf /etc/wpa_supplicant/
command sv restart wpa_supplicant
command sv restart dhcpcd
und "Waiting for services to restart"
command sleep 30s
