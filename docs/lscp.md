LSCP(1)                                                       General Commands Manual                                                      LSCP(1)

NAME
       lscp - list NILFS2 checkpoints

SYNOPSIS
       lscp [options] [device]

DESCRIPTION
       lscp  is a utility for displaying checkpoints or snapshots of the NILFS2 file system found in device.  When device is omitted, /proc/mounts
       is examined to find a NILFS2 file system.

       This command will fail if the device has no active mounts of a NILFS2 file system.

OPTIONS
       -a, --all
              Do not hide minor checkpoints.

       -b, --show-block-count
              Show number of used blocks instead of appended blocks.  This is the default mode.

       -g, --show-increment
              Show number of appended blocks instead of used blocks.

       -r, --reverse
              Reverse order.

       -s, --snapshot
              List only snapshots.

       -i index, --index=index
              Skip index checkpoints (or snapshots) at start of input.

       -n lines, --lines=lines
              List only lines input checkpoints (or snapshots).

       -h, --help
              Display help message and exit.

       -V, --version
              Display version and exit.

FIELD DESCRIPTION
       Every line of the lscp output consists of the following seven fields:

       CNO    Checkpoint number.

       DATE   Creation date.

       TIME   Creation time.

       MODE   Mode of the checkpoint; cp for a plain checkpoint, and ss for a snapshot.

       FLG    Flags on the checkpoint. At present, character ``i'' is printed in the field if the checkpoint was created only by  garbage  collec‐
              tion, checkpoint mode change, or other change of internal state.  Otherwise ``-'' is printed.

       NBLKINC (optional)
              Number of blocks appended by the checkpoint.  This field is displayed instead of BLKCNT field when -g option is specified.

       BLKCNT Number of blocks used by the checkpoint.

       ICNT   Number of inodes included in the entire file system at the time specified by the checkpoint.

BUGS
       NILFS2 in Linux kernel version 2.6.38 and earlier does not support the block count (BLKCNT) information.

AUTHOR
       Koji Sato

AVAILABILITY
       lscp is part of the nilfs-utils package and is available from http://nilfs.sourceforge.net.

SEE ALSO
       nilfs(8), mkcp(8), chcp(8), rmcp(8), nilfs-tune(8).

nilfs-utils version 2.2                                              Apr 2014                                                              LSCP(1)
