supervise(8)                                                  System Manager's Manual                                                 supervise(8)

NAME
       supervise - starts and monitors a service.

SYNOPSIS
       supervise s

DESCRIPTION
       supervise  switches  to  the  directory  named  s and starts ./run. It restarts ./run if ./run exits. It pauses for a second after starting
       ./run, so that it does not loop too quickly if ./run exits immediately.

       If the file s/down exists, supervise does not start ./run immediately. You can use svc(8) to start ./run and  to  give  other  commands  to
       supervise.

       supervise  maintains status information in a binary format inside the directory s/supervise, which must be writable to supervise.  The sta‐
       tus information can be read by svstat(8).

       supervise may exit immediately after startup if it cannot find the files it needs in s or if another copy of supervise is  already  running
       in  s.   Once supervise is successfully running, it will not exit unless it is killed or specifically asked to exit. You can use svok(8) to
       check whether supervise is successfully running. You can use svscan(8) to reliably start a collection of supervise processes.

SEE ALSO
       svc(8), svok(8), svstat(8), svscanboot(8), svscan(8), readproctitle(8), fghack(8),  pgrphack(8),  multilog(8),  tai64n(8),  tai64nlocal(8),
       setuidgid(8), envuidgid(8), envdir(8), softlimit(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                      supervise(8)
