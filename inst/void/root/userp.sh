#! /usr/bin/sh
. ../func.sh

username=u
groups="wheel,audio,disk,floppy,optical,cdrom,socklog,video,kvm,xbuilder,storage,bluetooth"
shell="/usr/bin/zsh"
# TODO: Check if network gives access to rfkill

und "Adding user and password groups: ($groups)"
command useradd -m -U -G "$groups"  -s "$shell" "$username"
command passwd "$username"
