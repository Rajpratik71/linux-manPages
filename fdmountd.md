fdmount(1)                                                                               General Commands Manual                                                                               fdmount(1)

Name
       fdmount - Floppy disk mount utility

Note
       This  manpage has been automatically generated from fdutils's texinfo documentation.  However, this process is only approximative, and some items, such as cross-references, footnotes and indices
       are lost in this translation process.  Indeed, these items have no appropriate representation in the manpage format.  Moreover, only the items specific to each command have been translated,  and
       the general information about fdutils has been dropped in the manpage version.  Thus I strongly advise you to use the original texinfo doc.

       *      To generate a printable copy from the texinfo doc, run the following commands:

                     ./configure; make dvi; dvips fdutils.dvi

       *      To generate a HTML copy,  run:

                     ./configure; make html

              A pre-made HTML can be found at: `http://www.tux.org/pub/knaff/fdutils'

       *      To generate an info copy (browsable using emacs' info mode), run:

                     ./configure; make info

       The texinfo doc looks most pretty when printed or as HTML.  Indeed, in the info version certain examples are difficult to read due to the quoting conventions used in info.

Description
          fdmount [-l] [--list] [-d] [--daemon] [--detach]
          [-i interval] [--interval interval] [-o mount-options]
          [-r] [-readonly] [-s] [--sync] [--nosync] [--nodev]
          [--nosuid] [--noexec] [-f] [--force] [-h] [--help]
          [drivename] [mountpoint]

          fdumount [-f] [--force] [drivename]

          fdlist

          fdmountd [-i interval] [--interval interval] [-r]
          [-readonly] [-s] [--sync] [--nosync] [--nodev]
          [--nosuid] [--noexec] [--help] [drivename] [mountpoint]]

       The  fdmount  program  mounts a floppy disk in the specified drive. It tries to figure out the exact format and filesystem type of the disk from data in the disk's boot sector or super block and
       the auto-detected track layout.

       Currently, fdmount supports the filesystems minix, ext, ext2, xia, and msdos, and includes special support for disks formatted by the 2M utility for MS-DOS.

       It also checks whether the disk is write protected, in which case it is mounted read-only.

       The symbolic drivename is (currently) one of `fd[0-7]', corresponding to the special device files `/dev/fd[0-7]'. If drivename is not specified, `fd0' is assumed.

       The disk is mounted on the directory mountpoint, if specified, or on `/fd[0-7]'.  In either case, the mount point must be an existing, writable directory.

       Due to a bug in the floppy driver (?), the polling interval (-i flag) must be longer than the spindown offset. Thus you need to do (for  example)  floppycontrol  --spindown  99  before  starting
       fdmountd in daemon mode

Options
       -l --list
              List all known drives with their symbolic name, type, and mount status.

       -d --daemon
              Run in daemon mode (see below).

       --detach
              Runs daemon in background, and detaches it from its tty. Messages produced after the fork are logged to syslog.

       -p file
       --pidfile file

              Dumps the process id of the daemon to file. This makes killing the daemon easier: kill -9 `cat file`

       -i interval
       --interval interval
              Set the polling interval for daemon mode. The unit for interval is 0.1 seconds, the default value is 10 (i.e. 1 second).

       -o options
       --options options
              Sets filesystem-specific options. So far, these are only available for DOS and Ext2 disks. The following DOS options are supported: check, conv, dotsOK, debug, fat, quiet, blocksize.  The
              following Ext2 options are supported: check, errors, grpid, bsdgroups, nogrpid, sysvgroups, bsddf, minixdf, resgid, debug, nocheck.  When running as a daemon, options not applying to  the
              disk that is inserted (because of its filesystem type) are not passed to mount.

       -r --readonly
              Mount the disk read-only. This is automatically assumed if the disk is write protected.

       -s --sync
              Mount with the SYNC option.

       --nosync
              Mounts without the SYNC option, even when running as daemon.

       --nodev
              Mount with the NODEV option. Ignored for msdos filesystems, otherwise always set for non-root users.

       --nosuid
              Mount with the NOSUID option. Ignored for msdos filesystems, otherwise always set for non-root users.

       --noexec
              Mount with the NOEXEC option.

       -f --force
              Attempt  a mount or unmount operation even `/etc/mtab' says that the drive is already mounted, or not mounted, respectively.  This option is useful if `/etc/mtab' got out of sync with the
              actual state for some reason.

       -h --help
              Show short parameter description

Security
       When mounting on the default mount point, the mount points' owner is set to the current user, and the access flags according to the user's umask.  For a specified mountpoint, owner  and  permis‐
       sions are left unchanged. Default mount points are called /fd0, /fd1, ... , /fd7.

       The user running fdmount must have read access to the floppy device for read only mounts, and read/write access for read/write mounts.

       Fdmount can be run suid root, allowing users to mount floppy disks. The following restrictions are placed upon non-root users:

       *      If a mountpoint is specified explicitly, it must be owned by the user.

       *      A user may only unmount a disk if the mount point is owned by the user, or if it the disk has been mounted by the same user.

       *      Non-msdos disks are automatically mounted with the nodev and nosuid flags set.

       However, do not rely on fdmount being secure at the moment.

Daemon mode
       In daemon mode, the specified drive is periodically checked and if a disk is inserted, it is automatically mounted.

       When  the  disk  is  removed, it is automatically unmounted.  However, it is recommended to unmount the disk manually before removing it. In order to limit corruption, disks are mounted with the
       SYNC option when running in daemon mode, unless the --nosync flag is given.

       Note that this mode has some potential drawbacks:

       *      Some floppy drives have to move the drive head physically in order to reset the disk change signal. It is strongly recommended not to use daemon mode with these drives.  See section flop‐
              pycontrol, for details.

       *      If a disk does not contain a filesystem (e.g. a tar archive), the mount attempt may slow down initial access.

       *      As fdmount cannot identify the user trying to use the disk drive, there is no way to protect privacy. Disks are always mounted with public access permissions set.

Diagnostics
       error opening device name

       error reading boot/super block
              fdmount failed to read the first 1K of the disk. The disk might be damaged, unformatted, or it may have a format which is unsupported by the FDC or the Linux kernel.

       unknown filesystem type
              No magic number of any of the supported filesystems (see above) could be identified.

       sorry, can′t figure out format (fs filesystem)
              The size of the filesystem on the disk is incompatible with the track layout detected by the kernel and an integer number of tracks. This may occur if the filesystem uses only part of the
              disk, or the track layout was detected incorrectly by the kernel.

       failed to mount fs> <sizeK-disk
              The actual mount system call failed.

       failed to unmount
              The actual unmount system call failed.

       cannot create lock file /etc/mtab~
              If `/etc/mtab~' exists, you should probably delete it. Otherwise, check permissions.

       Can′t access mountpoint
              Most probably, the default or specified mount point does not exist.  Use mkdir.

       mountpoint is not a directory
              The mountpoint is not a directory.

       not owner of mountpoint
              Non-root users must own the directory specified as mount point.  (This does not apply for the default mount points, /fd[0-3].)

       No write permission to mountpoint
              Non-root users must have write permission on the mount point directory.

       Not owner of mounted directory: UID=uid
              Non-root users cannot unmount if the mount point is owned (i.e. the disk was mounted) by another user.

       invalid drive name
              Valid drive names are `fd0', `fd1', etc.

       drive name does not exist
              The drive does not exist physically, is unknown to the Linux kernel, or is an unknown type.

       Drive name is mounted already
              Trying to mount a drive which appears to be mounted already.  Use the --force option if you think this is wrong.

       Drive name is not mounted
              Trying to unmount a drive which does not appear to be mounted.  Use the --force option if you think this is wrong.

       ioctl(...) failed
              If this occurs with the FDGETDRVTYP or FDGETDRVSTAT, ioctl's you should probably update your Linux kernel.

       mounted fs size-disk (options)
              Success message.

Bugs
       *      Fdmount should be more flexible about drive names and default mount points (currently hard coded).

       *      Probably not very secure yet (when running suid root).  Untested with ext and xia filesystems.

       *      Can't specify filesystem type and disk layout explicitly.

       *      In daemon mode, the drive light stays on all the time.

       *      Some newer filesystem types, such as vfat are not yet supported.

See Also
       Fdutils' texinfo doc

fdutils-5.5                                                                                      03Mar05                                                                                       fdmount(1)
