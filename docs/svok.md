svok(8)                                                       System Manager's Manual                                                      svok(8)

NAME
       svok - checks whether supervise(8) is running.

SYNOPSIS
       svok service

DESCRIPTION
       svok checks whether supervise(8) is successfully running in the directory named service.

EXIT CODES
       It silently exits 0 if supervise(8) is successfully running. It silently exits 100 if supervise(8) is not successfully running.

SEE ALSO
       supervise(8),  svc(8),  svstat(8),  svscanboot(8),  svscan(8),  readproctitle(8), fghack(8), pgrphack(8), multilog(8), tai64n(8), tai64nlo‐
       cal(8), setuidgid(8), envuidgid(8), envdir(8), softlimit(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                           svok(8)
