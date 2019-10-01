FSFREEZE(8)                                                                                 System Administration                                                                                 FSFREEZE(8)



NAME
       fsfreeze - suspend access to a filesystem (Linux Ext3/4, ReiserFS, JFS, XFS)

SYNOPSIS
       fsfreeze --freeze|--unfreeze mountpoint


DESCRIPTION
       fsfreeze suspends and resumes access to an filesystem

       fsfreeze halts new access to the filesystem and creates a stable image on disk.  fsfreeze is intended to be used with hardware RAID devices that support the creation of snapshots.

       fsfreeze  is  unnecessary  for  device-mapper  devices.  The  device-mapper  (and LVM) automatically freezes filesystem on the device when a snapshot creation is requested.  For more details see the
       dmsetup(8) man page.

       The mount-point argument is the pathname of the directory where the filesystem is mounted.  The filesystem must be mounted to be frozen (see mount(8)).

       Note that access time updates are also suspends if the filesystem is mounted with the traditional atime semantics (mount option strictatime, for more details see mount(8)).


OPTIONS
       -h, --help
              Print help and exit.

       -f, --freeze
              This option requests the specified a filesystem to be frozen from new modifications.  When this is selected, all ongoing transactions in the filesystem are allowed to complete, new write sys‐
              tem calls are halted, other calls which modify the filesystem are halted, and all dirty data, metadata, and log information are written to disk.  Any process attempting to write to the frozen
              filesystem will block waiting for the filesystem to be unfrozen.

              Note that even after freezing, the on-disk filesystem can contain information on files that are still in the process of unlinking.  These files will not be unlinked until  the  filesystem  is
              unfrozen or a clean mount of the snapshot is complete.

       -u, --unfreeze
              This option is used to un-freeze the filesystem and allow operations to continue.  Any filesystem modifications that were blocked by the freeze are unblocked and allowed to complete.

       -V, --version
              Show version number and exit.

AUTHOR
       Written by Hajime Taira.

NOTES
       This man page based on xfs_freeze.  One of -f or -u must be supplied to fsfreeze.

SEE ALSO
       mount(8)

AVAILABILITY
       The fsfreeze command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.




util-linux                                                                                         May 2010                                                                                       FSFREEZE(8)
