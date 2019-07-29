MKFS.BFS(8)                                                                              System Administration                                                                             MKFS.BFS(8)

NAME
       mkfs.bfs - make an SCO bfs filesystem

SYNOPSIS
       mkfs.bfs [options] device [block-count]

DESCRIPTION
       mkfs.bfs creates an SCO bfs filesystem on a block device (usually a disk partition or a file accessed via the loop device).

       The block-count parameter is the desired size of the filesystem, in blocks.  If nothing is specified, the entire partition will be used.

OPTIONS
       -N, --inodes number
              Specify the desired number of inodes (at most 512).  If nothing is specified, some default number in the range 48–512 is picked depending on the size of the partition.

       -V, --vname label
              Specify the volume label.  I have no idea if/where this is used.

       -F, --fname name
              Specify the filesystem name.  I have no idea if/where this is used.

       -v, --verbose
              Explain what is being done.

       -c     This option is silently ignored.

       -l     This option is silently ignored.

       -h, --help
              Display help text and exit.

       -V, --version
              Display version information and exit.  Option -V only works as --version when it is the only option.

EXIT CODES
       The exit code returned by mkfs.bfs is 0 when all went well, and 1 when something went wrong.

SEE ALSO
       mkfs(8)

AVAILABILITY
       The mkfs.bfs command is part of the util-linux package and is available from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                                                                                     July 2011                                                                                   MKFS.BFS(8)
