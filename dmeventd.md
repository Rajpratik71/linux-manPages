DMEVENTD(8)                                                                              System Manager's Manual                                                                              DMEVENTD(8)

NAME
       dmeventd — Device-mapper event daemon

SYNOPSIS
       dmeventd [-d [-d [-d]]] [-f] [-h] [-l] [-R] [-V] [-?]

DESCRIPTION
       dmeventd is the event monitoring daemon for device-mapper devices.  Library plugins can register and carry out actions triggered when particular events occur.

LVM PLUGINS
       Mirror
              Attempts to handle device failure automatically. See lvm.conf(5).

       Raid
              Attempts to handle device failure automatically. See lvm.conf(5).

       Snapshot
              Monitors  how  full  a  snapshot  is  becoming  and  emits  a  warning  to  syslog when it exceeds 80% full.  The warning is repeated when 85%, 90% and 95% of the snapshot is filled.  See
              lvm.conf(5).  Snapshot which runs out of space gets invalid and when it is mounted, it gets umounted if possible.

       Thin
              Monitors how full a thin pool data and metadata is becoming and emits a warning to syslog when it exceeds 80% full.  The warning is repeated when 85%, 90% and 95%  of  the  thin  pool  is
              filled.  See lvm.conf(5).  If the thin-pool runs out of space, thin volumes are umounted if possible.

OPTIONS
       -d
              Repeat from 1 to 3 times ( -d, -dd, -ddd ) to increase the detail of debug messages sent to syslog.  Each extra d adds more debugging information.

       -f
              Don't fork, run in the foreground.

       -h
              Show help information.

       -l
              Log through stdout and stderr instead of syslog.  This option works only with option -f, otherwise it is ignored.

       -?
              Show help information on stderr.

       -R
              Replace  a  running  dmeventd  instance. The running dmeventd must be version 2.02.77 or newer. The new dmeventd instance will obtain a list of devices and events to monitor from the cur‐
              rently running daemon.

       -V
              Show version of dmeventd.

SEE ALSO
       lvm(8), lvm.conf(5)

Red Hat Inc                                                                         DM TOOLS 2.02.133(2) (2015-10-30)                                                                         DMEVENTD(8)
