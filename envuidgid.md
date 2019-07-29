envuidgid(8)                                                  System Manager's Manual                                                 envuidgid(8)

NAME
       envuidgid - runs another program with environment variables indicating a specified account's uid and gid.

SYNOPSIS
       envuidgid account child

DESCRIPTION
       account is a single argument.  child consists of one or more arguments.

       envuidgid sets $UID to account's uid and $GID to account's gid. It then runs child.

EXIT CODES
       envuidgid exits 111 if it cannot find a UNIX account named account, if it runs out of memory for environment variables, or if it cannot run
       child.  Otherwise its exit code is the same as that of child.

SEE ALSO
       supervise(8), svc(8), svok(8), svstat(8), svscanboot(8),  svscan(8),  readproctitle(8),  fghack(8),  pgrphack(8),  multilog(8),  tai64n(8),
       tai64nlocal(8), setuidgid(8), envdir(8), softlimit(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                      envuidgid(8)
