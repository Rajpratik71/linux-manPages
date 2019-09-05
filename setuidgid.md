setuidgid(8)                                                  System Manager's Manual                                                 setuidgid(8)

NAME
       setuidgid - runs another program under a specified account's uid and gid.

SYNOPSIS
       setuidgid account child

DESCRIPTION
       account is a single argument.  child consists of one or more arguments.

       setuidgid sets its uid and gid to account's uid and gid, removing all supplementary groups. It then runs child.

       setuidgid cannot be run by anyone other than root.

EXIT CODES
       setuidgid  exits  111  if it cannot find a UNIX account named account, if it cannot setgid, if it cannot setuid, or if it cannot run child.
       Otherwise its exit code is the same as that of child.

SEE ALSO
       supervise(8), svc(8), svok(8), svstat(8), svscanboot(8),  svscan(8),  readproctitle(8),  fghack(8),  pgrphack(8),  multilog(8),  tai64n(8),
       tai64nlocal(8), envuidgid(8), envdir(8), softlimit(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                      setuidgid(8)
