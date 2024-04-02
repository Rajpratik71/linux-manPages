CHCP(8)                                                       System Manager's Manual                                                      CHCP(8)

NAME
       chcp - change mode of NILFS2 checkpoints

SYNOPSIS
       chcp [options] cp | ss [device] checkpoint-number ...

DESCRIPTION
       chcp  is  a  utility  to  change the mode of the given checkpoints for the NILFS2 file system found in device.  chcp changes checkpoints to
       snapshots, or vice versa.  The target checkpoints are specified with one or more checkpoint numbers.  When device is omitted, it  tries  to
       find a NILFS2 file system from /proc/mounts.

       This command is valid only for mounted NILFS2 file systems, and will fail if the device has no active mounts.

OPTIONS
       -h, --help
              Display help message and exit.

       -V, --version
              Display version and exit.

AUTHOR
       Koji Sato

AVAILABILITY
       chcp is part of the nilfs-utils package and is available from http://nilfs.sourceforge.net.

SEE ALSO
       nilfs(8), lscp(1), mkcp(8), rmcp(8), nilfs-tune(8).

nilfs-utils version 2.2                                              Apr 2014                                                              CHCP(8)
