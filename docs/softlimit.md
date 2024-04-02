softlimit(8)                                                  System Manager's Manual                                                 softlimit(8)

NAME
       softlimit - runs another program with new resource limits.

SYNOPSIS
       softlimit [ opts ] child

DESCRIPTION
       opts is a series of getopt-style options.  child consists of one or more arguments.

       softlimit sets soft resource limits as specified by opts.  It then runs child.

OPTIONS
       In each of the following opts, n may be =, indicating that the soft limit should be set equal to the hard limit.

       opts controlling memory use:

       -m n   Same as -d n -s n -l n -a n.

       -d n   Limit the data segment per process to n bytes.

       -s n   Limit the stack segment per process to n bytes.

       -l n   Limit the locked physical pages per process to n bytes. This option has no effect on some operating systems.

       -a n   Limit the total of all segments per process to n bytes. This option has no effect on some operating systems.

       -o n   Limit the number of open file descriptors per process to n.  This option has no effect on some operating systems.

       -p n   Limit the number of processes per uid to n.

       opts controlling file sizes:

       -f n   Limit output file sizes to n bytes.

       -c n   Limit core file sizes to n bytes.

       Efficiency opts:

       -r n   Limit the resident set size to n bytes. This limit is not enforced unless physical memory is full.

       -t n   Limit the CPU time to n seconds. This limit is not enforced except that the process receives a SIGXCPU signal after n seconds.

SEE ALSO
       supervise(8),  svc(8),  svok(8),  svstat(8),  svscanboot(8),  svscan(8),  readproctitle(8), fghack(8), pgrphack(8), multilog(8), tai64n(8),
       tai64nlocal(8), setuidgid(8), envuidgid(8), envdir(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                      softlimit(8)
