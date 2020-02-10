LVMETAD(8)                                                                               System Manager's Manual                                                                               LVMETAD(8)

NAME
       lvmetad — LVM metadata cache daemon

SYNOPSIS
       lvmetad [-l level[,level...]]  [-p pidfile_path] [-s socket_path] [-t timeout_value] [-f] [-h] [-V] [-?]

DESCRIPTION
       The lvmetad daemon caches LVM metadata, so that LVM commands can read metadata without scanning disks.

       Metadata caching can be an advantage because scanning disks is time consuming and may interfere with the normal work of the system and disks.

       lvmetad does not read metadata from disks itself.  The 'pvscan --cache' command scans disks, reads the LVM metadata and sends it to lvmetad.

       New  LVM  disks  that  appear  on the system must be scanned by pvscan before lvmetad knows about them.  If lvmetad does not know about a disk, then LVM commands using lvmetad will also not know
       about it.  When disks are added or removed from the system, lvmetad must be updated.

       lvmetad is usually combined with event-based system services that automatically run pvscan --cache on new disks.  This way, the lvmetad cache is automatically  updated  with  metadata  from  new
       disks when they appear.  LVM udev rules and systemd services implement this automation.  Automatic scanning is usually combined with automatic activation.  For more information, see pvscan(8).

       If lvmetad is started or restarted after disks have been added to the system, or if the global_filter has changed, the cache must be updated by running 'pvscan --cache'.

       When lvmetad is not used, LVM commands revert to scanning disks for LVM metadata.

       Use of lvmetad is enabled/disabled by:
       lvm.conf(5) global/use_lvmetad

       For more information on this setting, see:
       lvmconfig --withcomments global/use_lvmetad

       To ignore disks from LVM at the system level, e.g. lvmetad, pvscan use:
       lvm.conf(5) devices/global_filter

       For more information on this setting, see
       lvmconfig --withcomments devices/global_filter

OPTIONS
       To run the daemon in a test environment both the pidfile_path and the socket_path should be changed from the defaults.

       -f     Don't fork, but run in the foreground.

       -h, -? Show help information.

       -l levels
              Specify  the  levels of log messages to generate as a comma separated list.  Messages are logged by syslog.  Additionally, when -f is given they are also sent to standard error.  Possible
              levels are: all, fatal, error, warn, info, wire, debug.

       -p pidfile_path
              Path to the pidfile. This overrides both the built-in default (/run/lvmetad.pid) and the environment variable LVM_LVMETAD_PIDFILE.  This file is used to prevent more than one instance  of
              the daemon running simultaneously.

       -s socket_path
              Path to the socket file. This overrides both the built-in default (/run/lvm/lvmetad.socket) and the environment variable LVM_LVMETAD_SOCKET.  To communicate successfully with lvmetad, all
              LVM2 processes should use the same socket path.

       -t timeout_value
              The daemon may shutdown after being idle for the given time (in seconds). When the option is omitted or the value given is zero the daemon never shutdowns on idle.

       -V     Display the version of lvmetad daemon.

ENVIRONMENT VARIABLES
       LVM_LVMETAD_PIDFILE
              Path for the pid file.

       LVM_LVMETAD_SOCKET
              Path for the socket file.

SEE ALSO
       lvm(8), lvmconfig(8), lvm.conf(5), pvscan(8)

Red Hat Inc                                                                         LVM TOOLS 2.02.133(2) (2015-10-30)                                                                         LVMETAD(8)
