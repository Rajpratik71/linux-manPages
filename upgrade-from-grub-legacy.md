#!/bin/bash ‐e

if test ! ‐f /boot/grub/core.img ; then
  echo ‐e "0ore.img doesn’t exist, trying to create it.0 >&2
  grub‐install   ‐‐no‐floppy   ‐‐grub‐setup=/bin/true  "(hd0)"  >
/dev/null fi

echo   RESET   grub‐pc/install_devices   |    debconf‐communicate
>/dev/null

#  Pretend  we’re upgrading grub‐pc.  This will make our postinst
DTRT.    UPGRADE_FROM_GRUB_LEGACY=1      /var/lib/dpkg/info/grub‐
pc.postinst configure dummy‐version

if test ! ‐f /boot/grub/grub.cfg ; then
  echo ‐e "0alling update‐grub to generate grub.cfg0 >&2
  update‐grub    ||    cat    <<    EOF    Failed   to   generate
/boot/grub/grub.cfg but GRUB2 has been already installed to  your
MBR.  THIS MEANS YOU HAVE CURRENTLY AN UNBOOTABLE SYSTEM.  Either
fix the error from update‐grub and run $0 again  or  install  old
grub again and run grub‐install from it to have again grub‐legacy
in your MBR.  EOF fi

# These never contain any valuable information, and  they  aren’t
useful  for  # boot anymore, since we just overwrote MBR/PBR.  rm
‐f                                         /boot/grub/{{xfs,reis‐
erfs,e2fs,fat,jfs,minix}_stage1_5,stage{1,2}}   #  Remove  marker
file used to indicate that grub‐install was  run  rather  than  #
this  script.   Since stage2 has been removed, we don’t need this
any more.  rm ‐f /boot/grub/grub2‐installed

cat << EOF

GRUB Legacy has been removed, but its  configuration  files  have
been  preserved,  since this script cannot determine if they con‐
tain valuable information.  If you would like to remove the  con‐
figuration files as well, use the following command:

  rm ‐f /boot/grub/menu.lst*

EOF

