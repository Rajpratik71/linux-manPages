extlinux(1)                                                   General Commands Manual                                                  extlinux(1)

NAME
       extlinux - install the SYSLINUX bootloader on a ext2/ext3/ext4/btrfs filesystem

SYNOPSIS
       extlinux [options] directory

DESCRIPTION
       EXTLINUX  is  a  new  syslinux derivative, which boots from a Linux ext2/ext3/ext4 or btrfs filesystem.  It works the same way as SYSLINUX,
       with a few slight modifications.  It is intended to simplify first-time installation of Linux, and for creation of rescue  and  other  spe‐
       cial-purpose boot disks.

       The  installer  is  designed  to  be run on a mounted directory.  For example, if you have an ext2, ext3, ext4, or btrfs usb key mounted on
       /mnt, you can run the following command:

              extlinux --install /mnt

OPTIONS
       -H, --heads=#
              Force the number of heads.

       -i, --install
              Install over the current bootsector.

       -O, --clear-once
              Clear the boot-once command.

       -o, --once=command
              Execute a command once upon boot.

       -M, --menu-save=label
              Set the label to select as default on the next boot

       -r, --raid
              Fall back to the next device on boot failure.

       --reset-adv
              Reset auxiliary data.

       -S, --sectors=#
              Force the number of sectors per track.

       -U, --update
              Updates a previous EXTLINUX installation.

       -z, --zip
              Force zipdrive geometry (-H 64 -S 32).

       --device=devicename
              Override the automatic detection of device names.  This option is intended for special environments only and should not be  used  by
              normal users.  Misuse of this option can cause disk corruption and lost data.

FILES
       The  extlinux configuration file needs to be named syslinux.cfg or extlinux.conf and needs to be stored in the extlinux installation direc‐
       tory. For more information about the contents of extlinux.conf, see syslinux(1) manpage, section files.

BUGS
       I would appreciate hearing of any problems you have with SYSLINUX.  I would also like to hear from you if you have successfully  used  SYS‐
       LINUX, especially if you are using it for a distribution.

       If  you  are reporting problems, please include all possible information about your system and your BIOS; the vast majority of all problems
       reported turn out to be BIOS or hardware bugs, and I need as much information as possible in order to diagnose the problems.

       There is a mailing list for discussion among SYSLINUX users and for announcements of new and test versions. To  join,  send  a  message  to
       majordomo@linux.kernel.org with the line:

SEE ALSO
       syslinux(1)

SYSLINUX for ext2/ext3/ext4/btrfs filesystem                     18 December 2007                                                      extlinux(1)
