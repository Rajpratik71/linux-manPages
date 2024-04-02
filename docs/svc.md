svc(8)                                                        System Manager's Manual                                                       svc(8)

NAME
       svc - controls services monitored by supervise(8).

SYNOPSIS
       svc [ -udopchaitkx ] services

DESCRIPTION
       services consists of any number of arguments, each argument naming a directory used by supervise(8).

       svc applies all the options to each service in turn.

OPTIONS
       -u     Up. If the service is not running, start it. If the service stops, restart it.

       -d     Down. If the service is running, send it a TERM signal and then a CONT signal. After it stops, do not restart it.

       -o     Once. If the service is not running, start it. Do not restart it if it stops.

       -p     Pause. Send the service a STOP signal.

       -c     Continue. Send the service a CONT signal.

       -h     Hangup. Send the service a HUP signal.

       -a     Alarm. Send the service an ALRM signal.

       -i     Interrupt. Send the service an INT signal.

       -t     Terminate. Send the service a TERM signal.

       -k     Kill. Send the service a KILL signal.

       -x     Exit.   supervise(8)  will  exit  as  soon as the service is down. If you use this option on a stable system, you're doing something
              wrong; supervise(8) is designed to run forever.

SEE ALSO
       supervise(8), svok(8), svstat(8), svscanboot(8), svscan(8), readproctitle(8), fghack(8),  pgrphack(8),  multilog(8),  tai64n(8),  tai64nlo‐
       cal(8), setuidgid(8), envuidgid(8), envdir(8), softlimit(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                            svc(8)
