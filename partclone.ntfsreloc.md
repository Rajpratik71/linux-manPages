PARTCLONE.NTFSFIXB(8)                                          Partclone User Manual                                         PARTCLONE.NTFSFIXB(8)

NAME
       partclone.ntfsfixboot - deals with braindeadness with moving NTFS filesystems.

SYNOPSIS
       partclone.ntfsfixboot [-w] [-h n] [-t n] [-s n] [-b] [-f] [-p] {DEVICE}

DESCRIPTION
       partclone.ntfsfixboot is NOT a part of Partclone project but included to fix ntfs boot issue. Partclone provide utilities to backup used
       blocks and design for higher compatibility of the file system by using existing library, e.g. e2fslibs is used to read the used block of
       ext2 partition.

       Partclone.ntfsfixboot deals with braindeadness with moving NTFS filesystems. writted by Orgad Shaneh (2009) and Daniel J. Grace (2006).

OPTIONS
       The program follows the usual GNU command line syntax,a summary of options is included below.

        -w
           Write new start sector to the partition.

        -h num
           Specify number of heads per track. If omitted, determined via ioctl.

        -t num
           Specify number of sectors per track. If omitted, determined via ioctl.

        -s num
           New start sector to write. If omitted, determined via ioctl.

        -b
           Proceed even if the specified device is not a partition.

        -f
           Force the operation to occur even if device does not look like a valid NTFS partition or values are equal.

        -p
           Print debug information (values read, values requested etc.

       device
           where device points to an NTFS partition

DIAGNOSTICS
       The following diagnostics may be issued on stderr:

       partclone.ntfsfixboot provides some return codes, that can be used in scripts:

       Code   Diagnostic
       0      success (values are correct, or changed successfully)
       1      a change is needed, but -w was not specified
       2      an error occured

BUGS
       Report bugs to thomas@nchc.org.tw or http://partclone.org.

       Report bugs to upstrem http://sourceforge.net/projects/ntfsfixboot/.

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

partclone.ntfsfixboot                                               10/08/2015                                               PARTCLONE.NTFSFIXB(8)
