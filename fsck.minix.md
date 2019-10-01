FSCK(8)                                                                                     System Administration                                                                                     FSCK(8)



NAME
       fsck.minix - check consistency of Minix filesystem

SYNOPSIS
       fsck.minix [-larvsmf] device

DESCRIPTION
       fsck.minix performs a consistency check for the Linux MINIX filesystem.  The current version supports the 14 character and 30 character filename options.

       The  program assumes the filesystem is quiescent.  fsck.minix should not be used on a mounted device unless you can be sure nobody is writing to it (and remember that the kernel can write to it when
       it searches for files).

       The device name will usually have the following form:
              /dev/hda[1-63] (IDE disk 1)
              /dev/hdb[1-63] (IDE disk 2)
              /dev/sda[1-15] (SCSI disk 1)
              /dev/sdb[1-15] (SCSI disk 2)

       If the filesystem was changed (i.e., repaired), then fsck.minix will print "FILE SYSTEM HAS CHANGED" and will sync(2) three times before exiting.  Since Linux does not currently  have  raw  devices,
       there is no need to reboot at this time.

WARNING
       fsck.minix should not be used on a mounted filesystem.  Using fsck.minix on a mounted filesystem is very dangerous, due to the possibility that deleted files are still in use, and can seriously dam‐
       age a perfectly good filesystem!  If you absolutely have to run fsck.minix on a mounted filesystem (i.e., the root filesystem), make sure nothing is writing to the disk, and that no files are  "zom‐
       bies" waiting for deletion.

OPTIONS
       -l     List all filenames.

       -r     Perform interactive repairs.

       -a     Perform  automatic  repairs.   (This  option  implies -r and serves to answer all of the questions asked with the default.)  Note that this can be extremely dangerous in the case of extensive
              filesystem damage.

       -v     Be verbose.

       -s     Output super-block information.

       -m     Activate MINIX-like "mode not cleared" warnings.

       -f     Force a filesystem check even if the filesystem was marked as valid (this marking is done by the kernel when the filesystem is unmounted).

SEE ALSO
       fsck(8), fsck.ext2(8), mkfs(8), mkfs.minix(8), mkfs.ext2(8), reboot(8)

DIAGNOSTICS
       There are numerous diagnostic messages.  The ones mentioned here are the most commonly seen in normal usage.

       If the device does not exist, fsck.minix will print "unable to read super block".  If the device exists, but is not a MINIX filesystem, fsck.minix will print "bad magic number in super-block".

EXIT CODES
       The exit code returned by fsck.minix is the sum of the following:

       0      No errors

       3      Filesystem errors corrected, system should be rebooted if filesystem was mounted

       4      Filesystem errors left uncorrected

       7      Combination of exit codes 3 and 4

       8      Operational error

       16     Usage or syntax error

       In point of fact, only 0, 3, 4, 7, 8, and 16 can ever be returned.

AUTHOR
       Linus Torvalds (torvalds@cs.helsinki.fi)
       Error code values by Rik Faith (faith@cs.unc.edu)
       Added support for filesystem valid flag: Dr. Wettstein (greg%wind.uucp@plains.nodak.edu)
       Check to prevent fsck of mounted filesystem added by Daniel Quinlan (quinlan@yggdrasil.com)
       Minix v2 fs support by Andreas Schwab (schwab@issan.informatik.uni-dortmund.de), updated by Nicolai Langfeldt (janl@math.uio.no)
       Portability patch by Russell King (rmk@ecs.soton.ac.uk).

AVAILABILITY
       The fsck.minix command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        July 1996                                                                                           FSCK(8)
