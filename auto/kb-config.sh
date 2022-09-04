#! /bin/sh
XAUTHORITY="/home/u/.runtime/Xauthority"
DISPLAY=":0"
export XAUTHORITY DISPLAY

xset r rate 200 20
setxkbmap -model pc105 -layout 'us,ara(mac)' -option grp:alt_shift_toggle
echo -n 'menu gatt' | bluetoothctl

# bluetoothctl BUG: 
#   attribute-info does not work until this is invoked once at least
attr=/org/bluez/hci0/dev_FF_48_DE_58_48_B5/service0010/char0011
echo "menu gatt\nselect-attribute $attr\nread" | bluetoothctl
