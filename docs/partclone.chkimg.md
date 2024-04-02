PARTCLONE.CHKIMG(8)                                            Partclone User Manual                                           PARTCLONE.CHKIMG(8)

NAME
       partclone.chkimg - The utility to check image made by partclone

SYNOPSIS
       partclone.chkimg {[-s | --source] source}
                        [[-dX | --debug=X] [-N | --ncurses] [-f | --UI-fresh] [-F | --force] [--ignore_crc] [-X | --dialog] [-C | --no_check] [-L | --logfile] logfile]

DESCRIPTION
       partclone.chkimg is a part of Partclone project to veritfy image file. Partclone provide utilities to backup used blocks and design for
       higher compatibility of the file system by using existing library, e.g. e2fslibs is used to read the used block of ext2 partition.

       Partclone supported file system include btrfs, ext2, ext3, ext4, reiserfs, reiser4, xfs and jfs for LINUX. Also support some non-linux
       operation system, ex: NTFS, FAT, EXFAT(for Windows), HFS plus(APPLE MAC OS), UFS2(FreeBSD), VMFS(VMWare Vsphere). All partclone utils could
       be run like partclone.xxx is very smiliar fsck or mkfs. For example, for backup/restore hfsplus, just run partclone.hfsp.

OPTIONS
       The program follows the usual GNU command line syntax, with long options starting with two dashes (`-'). A summary of options is included
       below.

       -s FILE, --source FILE
           Source FILE. The FILE could be a image file(made by partclone) or device depend on your action. Normanly, backup source is device,
           restore source is image file.

           Receving data from pipe line is supported ONLY for restoring, just ignore -s option or use '-' means receive data from stdin.

       -l FILE, --logfile FILE
           put special path to record partclone log information.(default /var/log/partclone.log)

       -C, --no_check
           Don't check device size and free space.

       -N, --ncurse
           Using Ncurses Text User Interface.

       -X, --dialog
           Output message as Dialog Format.

       --ignore_crc
           Ignore crc check error.

       -F, --force
           Force progress.

       -f sec, --UI-fresh sec
           put special second to different interval.

       -dlevel, --debug level
           Set the debug level [1|2|3]

       -h, --help
           Show summary of options.

       -v, --version
           Show version of program.

FILES
       /var/log/partclone.log
           The log file of partclone.chkimg

EXAMPLES
            check part.img file is correct or not.
              partclone.chkimg -d -s partclone.img

DIAGNOSTICS
       The following diagnostics may be issued on stderr:

       partclone.chkimg provides some return codes, that can be used in scripts:

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

partclone.chkimg                                                    09/19/2015                                                 PARTCLONE.CHKIMG(8)
