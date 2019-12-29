DMEVENTD(8)                             System Manager's Manual                            DMEVENTD(8)

NAME
       dmeventd — Device-mapper event daemon

SYNOPSIS
       dmeventd [-d [-d [-d]]] [-f] [-h] [-l] [-R] [-V] [-?]

DESCRIPTION
       dmeventd  is the event monitoring daemon for device-mapper devices.  Library plugins can regis‐
       ter and carry out actions triggered when particular events occur.

OPTIONS
       -d
              Repeat from 1 to 3 times ( -d, -dd, -ddd ) to increase the detail of debug messages sent
              to syslog.  Each extra d adds more debugging information.

       -f
              Don't fork, run in the foreground.

       -h
              Show help information.

       -l
              Log through stdout and stderr instead of syslog.  This option works only with option -f,
              otherwise it is ignored.

       -?
              Show help information on stderr.

       -R
              Replace a running dmeventd instance. The running dmeventd must  be  version  2.02.77  or
              newer.  The  new  dmeventd  instance will obtain a list of devices and events to monitor
              from the currently running daemon.

       -V
              Show version of dmeventd.

LVM PLUGINS
       Mirror
              Attempts to handle device failure automatically. See lvm.conf(5).

       Raid
              Attempts to handle device failure automatically. See lvm.conf(5).

       Snapshot
              Monitors how full a snapshot is becoming and emits a warning to syslog when  it  exceeds
              80% full.  The warning is repeated when 85%, 90% and 95% of the snapshot is filled.  See
              lvm.conf(5).  Snapshot which runs out of space gets invalid and when it is  mounted,  it
              gets umounted if possible.

       Thin
              Monitors  how full a thin pool data and metadata is becoming and emits a warning to sys‐
              log when it exceeds 80% full.  The warning is repeated when more then 85%, 90%  and  95%
              of  the  thin pool is filled. See lvm.conf(5).  When a thin pool fills over 50% (data or
              metadata) thin plugin calls configured dmeventd/thin_command  with  every  5%  increase.
              With  default  setting it calls internal lvm lvextend --use-policies to resize thin pool
              when it's been filled above configured threshold activation/thin_pool_autoextend_thresh‐
              old.   If  the command fails, dmeventd thin plugin will keep retrying execution with in‐
              creasing time delay between retries upto 42 minutes.  User may also  configure  external
              command  to  support more advanced maintenance operations of a thin pool.  Such external
              command can e.g. remove some unneeded snapshots, use fstrim(8) to free recover space  in
              a thin pool, but also can use lvextend --use-policies if other actions have not released
              enough space.  Command is executed with environmental variable LVM_RUN_BY_DMEVENTD=1  so
              any  lvm2  command  executed in this environment will not try to interact with dmeventd.
              To see the fullness of a thin pool command may check these two  environmental  variables
              DMEVENTD_THIN_POOL_DATA  and  DMEVENTD_THIN_POOL_METADATA.  Command can also read status
              with tools like lvs(8).

ENVIRONMENT VARIABLES
       DMEVENTD_THIN_POOL_DATA
              Variable is set by thin plugin and is available to executed program. Value  present  ac‐
              tual usage of thin pool data volume. Variable is not set when error event is processed.

       DMEVENTD_THIN_POOL_METADATA
              Variable  is  set by thin plugin and is available to executed program. Value present ac‐
              tual usage of thin pool metadata volume. Variable is not set when error  event  is  pro‐
              cessed.

       LVM_RUN_BY_DMEVENTD
              Variable is set by thin plugin to prohibit recursive interation with dmeventd by any ex‐
              ecuted lvm2 command from a thin_command environment.

SEE ALSO
       lvm(8), lvm.conf(5)

Red Hat Inc                        DM TOOLS 2.03.02(2) (2018-12-18)                        DMEVENTD(8)
