MOUNT.NILFS2(8)                                               System Manager's Manual                                              MOUNT.NILFS2(8)

NAME
       mount.nilfs2 - mount a NILFS2 file system

SYNOPSIS
       mount -t nilfs2 [-finrvw] [-o options [,...]] device dir
       mount -t nilfs2 [-finrvw] [-o options [,...]] device | dir

       mount.nilfs2 [-fnrvw] [-o options [,...]] device dir

       mount.nilfs2 [-V]

DESCRIPTION
       mount.nilfs2  serves  to  attach a NILFS2 file system on the specified directory dir. It is intended to be executed from mount(8), and will
       invoke the garbage collector nilfs_cleanerd(8) after an actual mount system call has succeeded.  Conversely, umount.nilfs2(8) will shutdown
       the garbage collector before detaching the file system.

       The standard command line interface is the first form:
              mount -t nilfs2 [options] device dir
       This  tells  the  kernel to attach the NILFS2 file system on device at the directory dir.  With the second form, the mount program tries to
       find out a missing device or dir argument from the /etc/fstab table.

       The third form, which directly invokes mount.nilfs2, is also usable since mount.nilfs2 maintains by itself the system mount state  such  as
       the  list  of mounted file systems described in /etc/mtab. However, the first or the second form is usually recommended because some expan‐
       sive options are not supported by the third form.

OPTIONS
       The full set of options used by an invocation of mount(8) is determined by extracting the options from the fstab table, then  applying  any
       options specified by the -o argument, and finally applying a -r or -w option, when present.

       See mount(8) for the full set of options.  Commonly used options are as follows:

       -V     Output version.

       -f     Fakes mounting the file system, meaning that the actual system call will be skipped.  This option is used to add entries for devices
              that were mounted earlier with the -n option. It can also be used for invoking nilfs_cleanerd(8) skipped previously.

       -i     Don't call mount.nilfs2.  This disables garbage collection and handling of pseudo mount options.

       -n     Mount without writing in /etc/mtab.  This is necessary for example when /etc is on a read-only file system.

       -r     Mount the file system read-only.  A synonym is "-o ro".

       -v     Verbose mode.

       -w     Mount the file system read/write. This is the default. A synonym is "-o rw".

       -o     Options are specified with a -o flag followed by a comma separated string of options.  Some of these options are  only  useful  when
              they appear in the /etc/fstab file.  For standard filesystem options, see mount(8).

NILFS2 SPECIFIC MOUNT OPTIONS
       The following options apply only to the NILFS2 filesystem.  They all follow the -o flag.

       barrier / nobarrier
              These  options  enable/disable (default is enabled) barrier writes for the block I/O to a lower device.  The barrier write serves an
              important role to ensure consistency of filesystems after a system crash or power failure.  NILFS2 uses this feature by  default  to
              assure  the  reliability.   For  devices  not  supporting the barrier write, it will be disabled automatically and a warning will be
              logged.

       cp=checkpoint-number
              Specify the checkpoint-number of the snapshot to be mounted.  Checkpoints and snapshots are listed by lscp(1).  Only the checkpoints
              marked as snapshot are mountable with this option.  Note that the read-only mount option must be specified together.

       errors=continue / errors=remount-ro / errors=panic
              Define  the  behaviour when an error is encountered.  (Either ignore errors and just mark the file system erroneous and continue, or
              remount the file system read-only, or panic and halt the system.)  The default is remount-ro.  In earlier kernels than Linux 2.6.35,
              continue was the default.

       pp=protection-period
              Specify  the  protection-period  for  the cleaner daemon (in seconds). nilfs_cleanerd never deletes recent checkpoints whose elapsed
              time from its creation is smaller than protection-period.

       nogc   Disable garbage collection. The cleaner daemon will not be started.  It can be be started manually, but in that case it must also be
              stopped manually before unmounting.

       order=relaxed / order=strict
              Specify order semantics for file data.  Metadata is always written to follow the POSIX semantics about the order of filesystem oper‐
              ations.

              relaxed
                     Apply relaxed order semantics that allows modified data blocks to be written to disk without making a checkpoint if no  meta‐
                     data update is going.  This mode is equivalent to the ordered data mode of the ext3 filesystem except for the updates on data
                     blocks still conserve atomicity.  This will improve synchronous write performance for overwriting.  This is the default mode.

              strict Apply strict in-order semantics that preserves sequence of all file operations including overwriting of  data  blocks.   That
                     means,  it  is  guaranteed that no overtaking of events occurs in the recovered file system after a crash.  Unlike journaling
                     filesystems, NILFS2 does not write a same block twice to disk.  So there is no significant performance degradation in compar‐
                     ison with the relaxed mode except for file overwriting.

       norecovery
              Disable  recovery  of  the  filesystem  on mount.  This disables every write access on the device for read-only mounts or snapshots.
              This option will fail for r/w mounts on an unclean volume.

       discard / nodiscard
              These options enable/disable (default is disabled) the use of discard/TRIM commands.  The discard/TRIM  commands  are  sent  to  the
              underlying block device when blocks are freed.  This is useful for SSD devices and sparse/thinly-provisioned LUNs. (since 2.6.34).

RETURN CODES
       The return codes of mount.nilfs2 conform to those of mount(8); the following codes could be returned (the bits can be ORed):

       0      success

       1      incorrect invocation or permissions

       2      system error (out of memory, cannot fork, no more loop devices)

       4      internal bug

       8      user interrupt

       16     problems writing or locking /etc/mtab

       32     mount failure

       64     some mount succeeded

AUTHOR
       mount.nilfs2  is  written  by  Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp> for NILFS2, based on the mount program included in the util-
       linux package.

AVAILABILITY
       mount.nilfs2 is part of the nilfs-utils package and is available from http://nilfs.sourceforge.net.

SEE ALSO
       nilfs(8), mount(8), umount.nilfs2(8), nilfs_cleanerd(8), lscp(1).

nilfs-utils version 2.2                                              Apr 2014                                                      MOUNT.NILFS2(8)
