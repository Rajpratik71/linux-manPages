MKCP(8)                                                       System Manager's Manual                                                      MKCP(8)

NAME
       mkcp - make a NILFS2 checkpoint

SYNOPSIS
       mkcp [options] [device]

DESCRIPTION
       mkcp is a utility for making a checkpoint or snapshot for the NILFS2 file system found in device.  When device is omitted, it tries to find
       a NILFS2 file system from /proc/mounts.

       This command is valid only for mounted NILFS2 file systems, and will fail if the device has no active mounts.

OPTIONS
       -s, --snapshot
              Create a snapshot.

       -p, --print
              Print the checkpoint number when successfully created.

       -h, --help
              Display help message and exit.

       -V, --version
              Display version and exit.

AUTHOR
       Koji Sato

AVAILABILITY
       mkcp is part of the nilfs-utils package and is available from http://nilfs.sourceforge.net.

SEE ALSO
       nilfs(8), lscp(1), chcp(8), rmcp(8), nilfs-tune(8).

nilfs-utils version 2.2                                              Apr 2014                                                              MKCP(8)
