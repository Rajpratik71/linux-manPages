UMOUNT.NILFS2(8)                                              System Manager's Manual                                             UMOUNT.NILFS2(8)

NAME
       umount.nilfs2 - unmount NILFS2 file systems

SYNOPSIS
       umount [-t nilfs2] [-dfilnrv] device | dir [...]

       umount.nilfs2 [-nrv] dir [...]

       umount.nilfs2 [-V]

DESCRIPTION
       umount.nilfs2  detaches  the NILFS2 file system(s) mentioned from the file hierarchy.  This is the umount helper for NILFS2 to shutdown the
       garbage collector nilfs_cleanerd(8) before detaching the file system.  Usually it should be invoked through umount(8).

OPTIONS
       See umount(8) for the full set of options.  Commonly used options with NILFS2 are as follows:

       -V     Print version and exit.

       -i     Don't call umount.nilfs2.  Valid for umount(8).

       -n     Unmount without writing in /etc/mtab.  This option must be used carefully because mount.nilfs2 and umount.nilfs2 use  the  table  to
              store the process ID of nilfs_cleanerd(8).

       -r     In case unmounting fails, try to remount read-only.

       -v     Verbose mode.

THE LOOP DEVICE
       umount.nilfs2  will  free  the loop device (if any) associated with the mount, in case it finds the option `loop=...' in /etc/mtab.  The -d
       option, which also allows umount(8) to free the loop device without the `loop=...' option, is not supported.

AUTHOR
       umount.nilfs2 is written by Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp> for NILFS2, based on the umount program included in  the  util-
       linux package.

AVAILABILITY
       umount.nilfs2 is part of the nilfs-utils package and is available from http://nilfs.sourceforge.net.

SEE ALSO
       nilfs(8), umount(8), mount.nilfs2(8), nilfs_cleanerd(8).

nilfs-utils version 2.2                                              Apr 2014                                                     UMOUNT.NILFS2(8)
