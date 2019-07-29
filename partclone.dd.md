PARTCLONE.DD(8)                                                Partclone User Manual                                               PARTCLONE.DD(8)

NAME
       partclone.dd - unsupported file system backup utility.(like `dd` )

SYNOPSIS
       partclone.dd {[-s | --source] source} {[[-o | --output] [-O | --overwrite]] target}
                    [[-dX | --debug=X] [--restore_raw_file] [-z | --buffer_size] [-N | --ncurses] [-q | --quiet] [-f | --UI-fresh] [-F | --force] [-I | --ignore_fschk] [--ignore_crc] [-X | --dialog] [-C | --nocheck] [-R | --rescue] [-L | --logfile] logfile]

DESCRIPTION
       partclone.dd is a part of Partclone project to clone unsupported file system with dd method. It will backup all block from partition.
       Partclone provide utilities to backup used blocks and design for higher compatibility of the file system by using existing library, e.g.
       e2fslibs is used to read the used block of ext2 partition.

       Partclone supported file system include btrfs, ext2, ext3, ext4, reiserfs, reiser4, xfs and jfs for LINUX. Also support some non-linux
       operation system, ex: NTFS and FAT (for Windows), HFS plus(APPLE MAC OS), UFS2(FreeBSD), VMFS(VMWare Vsphere). All partclone utils could be
       run like partclone.xxx is very smiliar fsck or mkfs. For example, for backup/restore hfsplus, just run partclone.hfsp.

OPTIONS
       The program follows the usual GNU command line syntax, with long options starting with two dashes (`-'). A summary of options is included
       below.

       -s FILE, --source FILE
           Source FILE. The FILE could be a image file(made by partclone) or device depend on your action. Normanly, backup source is device,
           restore source is image file.

           Receving data from pipe line is supported ONLY for restoring, just ignore -s option or use '-' means receive data from stdin.

       -o FILE, --output FILE
           Output FILE. The FILE could be a image file(partclone will generate) or device depend on your action. Normanly, backup output to image
           file and restore output to device.

           Sending data to pipe line is also supported ONLY for back-up, just ignore -o option or use '-' means send data to stdout.

       -O FILE, --overwrite FILE
           Overwrite FILE, overwriting if exists.

       --restore_raw_file
           Creating special raw file for loop device.

       -l FILE, --logfile FILE
           put special path to record partclone log information.(default /var/log/partclone.log)

       -R, --rescue
           Continue after disk read errors.

       -C, --no_check
           Don't check device size and free space.

       -N, --ncurse
           Using Ncurses Text User Interface.

       -X, --dialog
           Output message as Dialog Format.

       -I, --ignore_fschk
           Ignore filesystem check.

       --ignore_crc
           Ignore crc check error.

       -F, --force
           Force progress.

       -f sec, --UI-fresh sec
           put special second to different interval.

       -z size, --buffer_size size
           Read/write buffer size (default: 1048576)

       -q, --quiet
           Disable progress message.

       -dlevel, --debug level
           Set the debug level [1|2|3]

       -h, --help
           Show summary of options.

       -v, --version
           Show version of program.

FILES
       /var/log/partclone.log
           The log file of partclone.dd

EXAMPLES
            clone /dev/hda1 to hda1.dd.img and display debug information.
              partclone.dd -d -s /dev/hda1 -o hda1.dd.img

            restore /dev/hda1 from hda1.dd.img and display debug information.
              partclone.dd -d -s hda1.dd.img -o /dev/hda1

DIAGNOSTICS
       The following diagnostics may be issued on stderr:

       partclone.dd provides some return codes, that can be used in scripts:

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

partclone.dd                                                        09/19/2015                                                     PARTCLONE.DD(8)
