FSCK.MINIX(8)                                                  System Administration                                                 FSCK.MINIX(8)

NAME
       fsck.minix - check consistency of Minix filesystem

SYNOPSIS
       fsck.minix [options] device

DESCRIPTION
       fsck.minix performs a consistency check for the Linux MINIX filesystem.

       The  program assumes the filesystem is quiescent.  fsck.minix should not be used on a mounted device unless you can be sure nobody is writ‐
       ing to it.  Remember that the kernel can write to device when it searches for files.

       The device name will usually have the following form:

              /dev/hda[1–63]   IDE disk 1
              /dev/hdb[1–63]   IDE disk 2
              /dev/sda[1–15]   SCSI disk 1
              /dev/sdb[1–15]   SCSI disk 2

       If the filesystem was changed, i.e., repaired, then fsck.minix will print "FILE SYSTEM HAS CHANGED" and will  sync(2)  three  times  before
       exiting.  There is no need to reboot after check.

WARNING
       fsck.minix  should not be used on a mounted filesystem.  Using fsck.minix on a mounted filesystem is very dangerous, due to the possibility
       that deleted files are still in use, and can seriously damage a perfectly good filesystem!  If you absolutely have to run fsck.minix  on  a
       mounted  filesystem,  such  as  the  root filesystem, make sure nothing is writing to the disk, and that no files are "zombies" waiting for
       deletion.

OPTIONS
       -l, --list
              List all filenames.

       -r, --repair
              Perform interactive repairs.

       -a, --auto
              Perform automatic repairs.  This option implies --repair and serves to answer all of the questions asked  with  the  default.   Note
              that this can be extremely dangerous in the case of extensive filesystem damage.

       -v, --verbose
              Be verbose.

       -s, --super
              Output super-block information.

       -m, --uncleared
              Activate MINIX-like "mode not cleared" warnings.

       -f, --force
              Force  a  filesystem  check  even  if  the  filesystem  was  marked  as valid.  Marking is done by the kernel when the filesystem is
              unmounted.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

DIAGNOSTICS
       There are numerous diagnostic messages.  The ones mentioned here are the most commonly seen in normal usage.

       If the device does not exist, fsck.minix will print "unable to read super block".  If the device exists, but is  not  a  MINIX  filesystem,
       fsck.minix will print "bad magic number in super-block".

EXIT CODES
       The exit code returned by fsck.minix is the sum of the following:

              0      No errors
              3      Filesystem errors corrected, system should be rebooted if filesystem was mounted
              4      Filesystem errors left uncorrected
              7      Combination of exit codes 3 and 4
              8      Operational error
              16     Usage or syntax error

AUTHORS
       Linus Torvalds ⟨torvalds@cs.helsinki.fi⟩
       Error code values by Rik Faith ⟨faith@cs.unc.edu⟩
       Added support for filesystem valid flag: Dr. Wettstein ⟨greg%wind.uucp@plains.nodak.edu⟩.
       Check to prevent fsck of mounted filesystem added by Daniel Quinlan ⟨quinlan@yggdrasil.com⟩.
       Minix v2 fs support by Andreas Schwab ⟨schwab@issan.informatik.uni-dortmund.de⟩, updated by Nicolai Langfeldt ⟨janl@math.uio.no⟩.
       Portability patch by Russell King ⟨rmk@ecs.soton.ac.uk⟩.

SEE ALSO
       fsck(8), fsck.ext2(8), mkfs(8), mkfs.ext2(8), mkfs.minix(8), reboot(8)

AVAILABILITY
       The fsck.minix command is part of the util-linux package and is available from Linux Kernel Archive ⟨https://www.kernel.org/pub/linux/utils
       /util-linux/⟩.

util-linux                                                           June 2015                                                       FSCK.MINIX(8)
