# Partitioning
  - delete all partitions
  - GPT (GUID Partition table)
  - use `fdisk` for example
fdisk /dev/sdn
d (to delete a partition)
p (to view partitions)
n (to add a partition)
(+xG on last sector for size in gigs)
w (write)

/usr and boot have to be on the same drive
SSD:
  - boot (512mb)
  - root (the rest)
HDD:
  - home (350 Gib)
  - var  (400 Gib)
  - opt  (150 Gib)
  - swap (30  Gib)

# Making the file system
swapoff /dev/sdnS (only if using archtools)
mkswap -L SWAP /dev/sdnS

mkfs.fat -F32 /dev/sdnX (boot partition)
mkfs.ext4 -L ROOT [HOME VAR OPT...] /dev/sdnY (home partition)

<!--
Setting up swapspace version 1, size = 16 GiB (17179865088 bytes)
LABEL=SWAP, UUID=37283163-fe63-49d0-8b6c-714b21702823
-->
# mounting
swapon /dev/sdnS
mount /dev/sdY /mnt (root)
mount /dev/sdnY /mnt/(home) mkdir obvs
mount /dev/sdnX /mnt (boot) mkdir ovs

# updating database
pacman -Syy

# select mirrors
vim /etc/pacman.d/mirrorlist

# installing base system
pacstrap /mnt base base-devel linux linux-firmware networkmanager vim man man-db texinfo grub os-prober efibootmgr dhcpcd git zsh xorg-server xorg-xinit libxft libxinerama ttf-dejavu ttf-font-awesome xlockmore

# fstab file
`genfstab -U [or L] /mnt >> /mnt/etc/fstab`

# chroot
arch-chroot /mnt

# System clock
ln -sf /usr/share/zoneinfo/Canada/Eastern /etc/localtime
hwclock --systohc

# Localization
vim /etc/locale.gen
locale-gen
<!--en_CA.UTF-8 -->
<!--en_CA ISO-8859-1-->

create /etc/locale.conf which is source by /etc/profile which is sourced by .zprofile (zsh) and add this
LANG=en_CA.utf-8 (in locale.conf)

# Bootloader
mkdir /boot/efi && grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub
(edit /etc/default/grub)
grub-mkconfig -o /boot/grub/grub.cfg

# intramfs
mkinitcpio -P (ignore the warnings)

# Add users and user groups
passwd (root's passwd)
useradd -m -g wheel *some user*
passwd *some user*

there is userdel, groupdel, groupadd and shit

export EDITOR=/usr/bin/vim
visudo

# Network config
vim /etc/hostname
*some hostname*

su *some user* (to change user)

# Time
timedatectl set-timezone Canada/Eastern

# Reboot
exit (^D)
umount -R /mnt
reboot
