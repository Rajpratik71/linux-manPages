E2UNDO(8)                                                                               System Manager's Manual                                                                              E2UNDO(8)

NAME
       e2undo - Replay an undo log for an ext2/ext3/ext4 filesystem

SYNOPSIS
       e2undo [ -f ] [ -h ] [ -n ] [ -o offset ] [ -v ] [ -z undo_file ] undo_log device

DESCRIPTION
       e2undo will replay the undo log undo_log for an ext2/ext3/ext4 filesystem found on device.  This can be used to undo a failed operation by an e2fsprogs program.

OPTIONS
       -f     Normally,  e2undo  will check the filesystem superblock to make sure the undo log matches with the filesystem on the device.  If they do not match, e2undo will refuse to apply the undo
              log as a safety mechanism.  The -f option disables this safety mechanism.

       -h     Display a usage message.

       -n     Dry-run; do not actually write blocks back to the filesystem.

       -o offset
              Specify the filesystem's offset (in bytes) from the beginning of the device or file.

       -v     Report which block we're currently replaying.

       -z undo_file
              Before overwriting a file system block, write the old contents of the block to an undo file.  This undo file can be used with e2undo(8) to restore the old contents of the  file  system
              should  something  go wrong.  If the empty string is passed as the undo_file argument, the undo file will be written to a file named e2undo-device.e2undo in the directory specified via
              the E2FSPROGS_UNDO_DIR environment variable.

              WARNING: The undo file cannot be used to recover from a power or system crash.

AUTHOR
       e2undo was written by Aneesh Kumar K.V. (aneesh.kumar@linux.vnet.ibm.com)

AVAILABILITY
       e2undo is part of the e2fsprogs package and is available from http://e2fsprogs.sourceforge.net.

SEE ALSO
       mke2fs(8), tune2fs(8)

E2fsprogs version 1.44.1                                                                      March 2018                                                                                     E2UNDO(8)
