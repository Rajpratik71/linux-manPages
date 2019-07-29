fghack(8)                                                     System Manager's Manual                                                    fghack(8)

NAME
       fghack - is an anti-backgrounding tool.

SYNOPSIS
       fghack child

DESCRIPTION
       fghack  runs  child with many extra descriptors writing to a pipe.  fghack reads and discards any data written to the pipe. After child has
       exited and the pipe has been closed, fghack exits.

SEE ALSO
       supervise(8), svc(8), svok(8), svstat(8), svscanboot(8), svscan(8), readproctitle(8), pgrphack(8), multilog(8), tai64n(8),  tai64nlocal(8),
       setuidgid(8), envuidgid(8), envdir(8), softlimit(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                         fghack(8)
