setlock(8)                                                    System Manager's Manual                                                   setlock(8)

NAME
       setlock - runs another program with a file locked.

SYNOPSIS
       setlock [ -nNxX ] fn child

DESCRIPTION
       fn is a single argument.  child consists of one or more arguments.

       setlock opens fn for writing (creating it if it does not exist), obtains an exclusive lock on it, and runs child.

       Normally the lock disappears when child exits.

       Here's  the  complete  story:  child is given a descriptor for a locked ofile pointing to the disk file named fn.  The lock disappears when
       this ofile is

       o      closed by all the processes that have descriptors for it or

       o      explicitly unlocked.

OPTIONS
       -n     No delay. If fn is locked by another process, setlock gives up.

       -N     (Default.) Delay. If fn is locked by another process, setlock waits until it can obtain a new lock.

       -x     If fn cannot be opened (or created) or locked, setlock exits zero.

       -X     (Default.) If fn cannot be opened (or created) or locked, setlock prints an error message and exits nonzero.

SEE ALSO
       supervise(8), svc(8), svok(8), svstat(8), svscanboot(8),  svscan(8),  readproctitle(8),  fghack(8),  pgrphack(8),  multilog(8),  tai64n(8),
       tai64nlocal(8), setuidgid(8), envuidgid(8), envdir(8), softlimit(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                        setlock(8)
