RMCP(8)                                                       System Manager's Manual                                                      RMCP(8)

NAME
       rmcp - remove NILFS2 checkpoints

SYNOPSIS
       rmcp [options] [device] checkpoint-range ...

DESCRIPTION
       rmcp  is  a  utility  for removing checkpoints from the NILFS2 file system found in device.  The checkpoints which user wants to remove are
       specified with one or more checkpoint-ranges.  When device is omitted, rmcp tries to find a NILFS2 file system from /proc/mounts.

       The checkpoint-range must be provided with one or two integers in one of the following way:

       cno    single checkpoint number

       start..end
              every checkpoint number between start and end

       ..end  every checkpoint number equal or younger than end

       start..
              every checkpoint number equal or greater than start

       This command is valid only for mounted NILFS2 file systems, and will fail if the device has no active mounts.

OPTIONS
       -f, --force
              Ignore snapshots or nonexistent checkpoints.

       -i, --interactive
              Prompt before any removal.

       -h, --help
              Display help message and exit.

       -V, --version
              Display version and exit.

AUTHOR
       Koji Sato, Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>.

AVAILABILITY
       rmcp is part of the nilfs-utils package and is available from http://nilfs.sourceforge.net.

SEE ALSO
       nilfs(8), lscp(1), mkcp(8), chcp(8), nilfs-tune(8).

nilfs-utils version 2.2                                              Apr 2014                                                              RMCP(8)
