svstat(8)                                                     System Manager's Manual                                                    svstat(8)

NAME
       svstat - prints the status of services monitored by supervise(8).

SYNOPSIS
       svstat services

DESCRIPTION
       services  consists of any number of arguments, each argument naming a directory.  svstat prints one human-readable line for each directory,
       saying whether supervise(8) is successfully running in that directory, and reporting the status information maintained by supervise(8).

SEE ALSO
       supervise(8), svc(8), svok(8), svscanboot(8), svscan(8), readproctitle(8), fghack(8), pgrphack(8), multilog(8), tai64n(8),  tai64nlocal(8),
       setuidgid(8), envuidgid(8), envdir(8), softlimit(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                         svstat(8)
