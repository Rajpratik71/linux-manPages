FSADM(8)                                                                                      FSADM(8)

NAME
       fsadm — utility to resize or check filesystem on a device

SYNOPSIS
       fsadm [options] check device
       fsadm [options] resize device [new_size]

DESCRIPTION
       fsadm  utility  checks or resizes the filesystem on a device.  It tries to use the same API for
       ext2, ext3, ext4, ReiserFS and XFS filesystem.

OPTIONS
       -e|--ext-offline
              Unmount ext2/ext3/ext4 filesystem before doing resize.

       -f|--force
              Bypass some sanity checks.

       -h|--help
              Display the help text.

       -n|--dry-run
              Print commands without running them.

       -v|--verbose
              Be more verbose.

       -y|--yes
              Answer "yes" at any prompts.

       -c|--cryptresize
              Resize dm-crypt mapping together with filesystem detected on the  device.  The  dm-crypt
              device must be recognizable by cryptsetup(8).

       new_size[B|K|M|G|T|P|E]
              Absolute  number of filesystem blocks to be in the filesystem, or an absolute size using
              a suffix (in powers of 1024).  If new_size is not supplied, the whole device is used.

DIAGNOSTICS
       On successful completion, the status code is 0.  A status code of 2 indicates the operation was
       interrupted  by the user.  A status code of 3 indicates the requested check operation could not
       be performed because the filesystem is mounted and does not support an online fsck(8).  A  sta‐
       tus code of 1 is used for other failures.

EXAMPLES
       Resize  the  filesystem on logical volume /dev/vg/test to 1000 megabytes.  If /dev/vg/test con‐
       tains ext2/ext3/ext4 filesystem it will be unmounted prior the  resize.   All  [y/n]  questions
       will be answered 'y'.

       fsadm -e -y resize /dev/vg/test 1000M

ENVIRONMENT VARIABLES
       TMPDIR The temporary directory name for mount points. Defaults to "/tmp".

       DM_DEV_DIR
              The device directory name.  Defaults to "/dev" and must be an absolute path.

SEE ALSO
       lvm(8),   lvresize(8),   lvm.conf(5),   fsck(8),   tune2fs(8),  resize2fs(8),  reiserfstune(8),
       resize_reiserfs(8), xfs_info(8), xfs_growfs(8), xfs_check(8), cryptsetup(8)

Red Hat, Inc                       LVM TOOLS 2.03.02(2) (2018-12-18)                          FSADM(8)
