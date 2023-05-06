#! /bin/sh
XAUTHORITY="/home/u/.runtime/Xauthority"
DISPLAY=":0"
export XAUTHORITY DISPLAY

xset r rate 300 10 -display $DISPLAY
setxkbmap -model pc105 -layout 'us,ara(mac)' -option grp:toggle -display $DISPLAY

a=$(bluetooth)
case "$a" in
  *off*)
    echo "bluetooth off"
    ;;
  *) 
    printf 'menu gatt' | bluetoothctl
    # BUG: bluetoothctl attribute-info does not work until this is invoked once
    attr=/org/bluez/hci0/dev_FF_48_DE_58_48_B5/service0010/char0011
    com="menu gatt
    select-attribute $attr
    read" 
    printf "%s" "$com" | bluetoothctl
    ;;
esac
