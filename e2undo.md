E2UNDO(8)                                                                                System Manager's Manual                                                                                E2UNDO(8)

NAME
       e2undo - Replay an undo log for an ext2/ext3/ext4 filesystem

SYNOPSIS
       e2undo [ -f ] undo_log device

DESCRIPTION
       e2undo will replay the undo log undo_log for an ext2/ext3/ext4 filesystem found on device.  This can be used to undo a failed operation by an e2fsprogs program.

OPTIONS
       -f     Normally,  e2undo  will  check the filesystem UUID and last modified time to make sure the undo log matches with the filesystem on the device.  If they do not match, e2undo will refuse to
              apply the undo log as a safety mechanism.  The -f option disables this safety mechanism.

AUTHOR
       e2undo was written by Aneesh Kumar K.V. (aneesh.kumar@linux.vnet.ibm.com)

AVAILABILITY
       e2undo is part of the e2fsprogs package and is available from http://e2fsprogs.sourceforge.net.

SEE ALSO
       mke2fs(8), tune2fs(8)

E2fsprogs version 1.42.13                                                                        May 2015                                                                                       E2UNDO(8)
