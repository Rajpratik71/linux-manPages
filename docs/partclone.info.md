PARTCLONE.INFO(8)                                              Partclone User Manual                                             PARTCLONE.INFO(8)

NAME
       partclone.info - The utility to show image head information.

SYNOPSIS
       partclone.info {FILE}

DESCRIPTION
       partclone.info is a part of Partclone project to retrive partition head information from image file. Partclone provide utilities to backup
       used blocks and design for higher compatibility of the file system by using existing library, e.g. e2fslibs is used to read the used block
       of ext2 partition.

       Partclone supported file system include btrfs, ext2, ext3, ext4, reiserfs, reiser4, xfs and jfs for LINUX. Also support some non-linux
       operation system, ex: NTFS, FAT, EXFAT(for Windows), HFS plus(APPLE MAC OS), UFS2(FreeBSD), VMFS(VMWare Vsphere). All partclone utils could
       be run like partclone.xxx is very smiliar fsck or mkfs. For example, for backup/restore hfsplus, just run partclone.hfsp.

OPTIONS
       The program follows the usual GNU command line syntax, with long options starting with two dashes (`-'). A summary of options is included
       below.

       FILE
           Image FILE. The FILE could be a image file(made by partclone).

EXAMPLES
             Retriving partition usage information
               partclone.info /home/partimag/sdb2.img
               Partclone v0.2.20 http://partclone.org
               File system:  EXTFS
               Device size:  928.0 MB
               Space in use: 535.4 MB
               Free Space:   392.6 MB
               Block size:   4096 Byte
               Used block :  130708

DIAGNOSTICS
       The following diagnostics may be issued on stderr:

       partclone.info provides some return codes, that can be used in scripts:

       Code   Diagnostic
       0      Program exited successfully.
       1      Clone or Restore seem failed.

BUGS
       Report bugs to thomas@nchc.org.tw or http://partclone.org.

       You can get support at http://partclone.org

SEE ALSO
       partclone(8), partclone.chkimg(8), partclone.restore(8), partclone.dd(8), partclone.info(8)

AUTHOR
       Yu-Chin Tsai <thomas@nchc.org.tw>

COPYRIGHT
       Copyright © 2007 Yu-Chin Tsai

       This manual page was written for the Debian system (and may be used by others).

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or (at
       your option) any later version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

partclone.info                                                      09/19/2015                                                   PARTCLONE.INFO(8)
