# Systemd
  - systemctl enable bumblebeed.service
  - systemctl enable NetworkManager.service
  - systemctl enable i8kmon.service
  - systemctl enable cronie.service
  - [hibernate](edit /etc/systemd/sleep.conf : uncomment)
    - HibernateMode=platform shutdown
    - HibernateState=disk
  - tlp
# irssi
cpanm Text::Aspell --sudo

# NVIM
npm install -g neovim (in super user sudo su) 
gem install neovim

# BUMBELBEE CARD
To turn on/off DGPU
`sudo tee /proc/acpi/bbswitch <<<OFF`
`sudo tee /proc/acpi/bbswitch <<<ON`

To check if it's on or off
`cat /proc/acpi/bbswitch`

to check refusal of bbswitch
`sudo dmesg | grep bbswitch`

# GTK
Solarized-black-cyan
https://www.gnome-look.org/p/1388140/
extract into /usr/share/themes
